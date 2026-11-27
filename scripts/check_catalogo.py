#!/usr/bin/env python3
"""Confere o catálogo por departamento e o padrão de qualidade das skills do kit.

Uso:
  python3 scripts/check_catalogo.py                    # só confere (sai com erro se algo falhar)
  python3 scripts/check_catalogo.py --relatorio        # também regrava catalogo/QUALIDADE.md
  python3 scripts/check_catalogo.py --atualizar-readme # regrava o bloco do catálogo no README.md

Não acessa a rede e não executa nada das skills.
"""
from pathlib import Path
import json, re, sys
import yaml

ROOT = Path(__file__).resolve().parents[1]
SKILLS = ROOT / "plugin" / "skills"
CATALOGO = ROOT / "catalogo" / "departamentos.json"
README = ROOT / "README.md"
RELATORIO = ROOT / "catalogo" / "QUALIDADE.md"
INICIO, FIM = "<!-- catalogo:inicio -->", "<!-- catalogo:fim -->"

STATUS = {"estavel": "estável", "beta": "beta"}
LIMITE_LINHAS = 500          # corpo do SKILL.md (progressive disclosure)
LIMITE_DESCRICAO = 1024      # limite do campo description no Claude
CAMINHO_ABSOLUTO = re.compile(r"/Users/[A-Za-z0-9._-]+/|/home/[a-z0-9._-]+/|[A-Z]:\\Users\\[A-Za-z]")
# Material interno da Academia que nunca vai para o repositório das alunas.
MARCADORES_INTERNOS = ["mapa-drive-ac", "00) COMECE AQUI", "plugin-academia-de-contadores", "ac-skills-internas"]
TEXTO = {".md", ".txt", ".yaml", ".yml", ".json", ".py", ".rb", ".sh", ".toml", ".csv"}


def carregar():
    catalogo = json.loads(CATALOGO.read_text())
    pastas = sorted(p.name for p in SKILLS.iterdir() if p.is_dir())
    return catalogo, pastas


def frontmatter(pasta):
    texto = (SKILLS / pasta / "SKILL.md").read_text()
    return yaml.safe_load(texto.split("---", 2)[1]), texto


def conferir():
    """Devolve (erros, avisos, linhas_do_relatorio)."""
    catalogo, pastas = carregar()
    deps, skills = catalogo["departamentos"], catalogo["skills"]
    erros, avisos, linhas = [], [], []
    for nome in sorted(set(pastas) - set(skills)):
        erros.append(f"{nome}: pasta em plugin/skills sem entrada no catálogo")
    for nome in sorted(set(skills) - set(pastas)):
        erros.append(f"{nome}: está no catálogo mas não existe em plugin/skills")
    for nome in pastas:
        if nome not in skills:
            continue
        item = skills[nome]
        if item.get("departamento") not in deps:
            erros.append(f"{nome}: departamento '{item.get('departamento')}' não existe")
        if item.get("status") not in STATUS:
            erros.append(f"{nome}: status '{item.get('status')}' inválido (use {', '.join(STATUS)})")
        for campo in ("titulo", "uso", "exemplo"):
            if not str(item.get(campo, "")).strip():
                erros.append(f"{nome}: campo '{campo}' vazio no catálogo")
        cab, texto = frontmatter(nome)
        desc = str(cab.get("description", ""))
        n_linhas = len(texto.splitlines())
        if n_linhas > LIMITE_LINHAS:
            erros.append(f"{nome}: SKILL.md com {n_linhas} linhas (limite {LIMITE_LINHAS}); mova detalhes para references/")
        if len(desc) > LIMITE_DESCRICAO:
            erros.append(f"{nome}: description com {len(desc)} caracteres (limite {LIMITE_DESCRICAO})")
        caminhos, internos = [], []
        for arq in (SKILLS / nome).rglob("*"):
            if not arq.is_file() or arq.suffix.lower() not in TEXTO:
                continue
            conteudo = arq.read_text(errors="ignore")
            if CAMINHO_ABSOLUTO.search(conteudo):
                caminhos.append(str(arq.relative_to(ROOT)))
            if any(m in conteudo for m in MARCADORES_INTERNOS):
                internos.append(str(arq.relative_to(ROOT)))
        for c in caminhos:
            erros.append(f"{nome}: caminho absoluto de computador em {c}")
        for c in internos:
            erros.append(f"{nome}: material interno da Academia em {c}")
        obs = []
        if re.match(r"\s*Use (when|for)\b", desc):
            obs.append("description começa em inglês")
            avisos.append(f"{nome}: description começa em inglês ('Use when...'); padronizar em português")
        tem_testes = (SKILLS / nome / "evaluations").is_dir()
        if not tem_testes:
            obs.append("sem cenários de teste")
            avisos.append(f"{nome}: sem pasta evaluations/ com cenários de teste")
        if item.get("status") == "beta":
            obs.append("beta")
        arquivos = sum(1 for p in (SKILLS / nome).rglob("*") if p.is_file())
        linhas.append((deps.get(item.get("departamento"), {}).get("label", "?"), nome, n_linhas, len(desc), arquivos,
                       "sim" if tem_testes else "não", "; ".join(obs) or "ok"))
    if README.exists():
        leia = README.read_text()
        for nome in pastas:
            if nome not in leia:
                erros.append(f"{nome}: não aparece no README.md (rode --atualizar-readme)")
    return erros, avisos, linhas


def bloco_readme():
    catalogo, pastas = carregar()
    deps, skills = catalogo["departamentos"], catalogo["skills"]
    saida = [INICIO, ""]
    for chave, dep in deps.items():
        membros = [n for n in pastas if skills.get(n, {}).get("departamento") == chave]
        if not membros:
            continue
        saida += [f"### {dep['emoji']} {dep['label']}", "", dep["descricao"], "",
                  "| Skill | Para que usar | Precisa de |", "|---|---|---|"]
        for n in membros:
            s = skills[n]
            titulo = s["titulo"] + (" (beta)" if s["status"] == "beta" else "")
            req = "; ".join(s["requisitos"]) or "—"
            saida.append(f"| `{n}` · {titulo} | {s['uso']} | {req} |")
        saida.append("")
        for n in membros:
            saida += [f"<details><summary>Exemplo de pedido para <code>{n}</code></summary>", "",
                      f"> {skills[n]['exemplo']}", "", "</details>", ""]
    saida.append(FIM)
    return "\n".join(saida)


def atualizar_readme():
    texto = README.read_text()
    if INICIO not in texto or FIM not in texto:
        sys.exit("README.md sem os marcadores do catálogo")
    antes, resto = texto.split(INICIO, 1)
    _, depois = resto.split(FIM, 1)
    README.write_text(antes + bloco_readme() + depois)


def gravar_relatorio(erros, avisos, linhas):
    out = ["# Qualidade das skills do kit", "",
           "Gerado por `python3 scripts/check_catalogo.py --relatorio`. Os critérios estão em [CONTRIBUTING.md](../CONTRIBUTING.md).", "",
           "| Departamento | Skill | Linhas do SKILL.md | Caracteres da description | Arquivos | Cenários de teste | Observações |",
           "|---|---|---|---|---|---|---|"]
    out += [f"| {d} | `{n}` | {l} | {c} | {a} | {t} | {o} |" for d, n, l, c, a, t, o in sorted(linhas)]
    out += ["", "## Erros", ""] + ([f"- {e}" for e in erros] or ["Nenhum."])
    out += ["", "## Avisos (não bloqueiam a publicação)", ""] + ([f"- {a}" for a in avisos] or ["Nenhum."])
    RELATORIO.write_text("\n".join(out) + "\n")


def main():
    if "--atualizar-readme" in sys.argv:
        atualizar_readme()
    erros, avisos, linhas = conferir()
    if "--relatorio" in sys.argv:
        gravar_relatorio(erros, avisos, linhas)
    for a in avisos:
        print("aviso:", a)
    for e in erros:
        print("ERRO:", e)
    print(f"{len(linhas)} skills conferidas, {len(erros)} erros, {len(avisos)} avisos")
    sys.exit(1 if erros else 0)


if __name__ == "__main__":
    main()
