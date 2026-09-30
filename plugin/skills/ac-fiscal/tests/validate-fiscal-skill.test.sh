#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
validator="$root/scripts/validate-fiscal-skill.rb"

required=(
  SKILL.md
  agent.yaml
  agents/openai.yaml
  references/source-policy.md
  references/fiscal-outputs.md
  references/approval-policy.md
  evaluations/parity/questions.yaml
  evaluations/rubrics/behavior.md
  scripts/validate-fiscal-skill.rb
)

runtime_knowledge=(
  knowledge/original/00-INDICE-FISCAL.md
  knowledge/live-2026-08-22/01-REGRAS-DE-USO-E-LIMITES.md
  knowledge/live-2026-08-22/02-ESCOPO-E-ROTEAMENTO.md
  knowledge/live-2026-08-22/03-FONTES-CANONICAS.md
  knowledge/live-2026-08-22/04-SKILLS-E-CENARIOS-DE-USO.md
  knowledge/live-2026-08-22/05-PERGUNTAS-TESTE-E-RESPOSTAS-ESPERADAS.md
  knowledge/live-2026-08-22/06-GUARDRAILS-E-CLAIMS-BLOQUEADOS.md
  knowledge/live-2026-08-22/07-MODELOS-DE-RESPOSTA-E-CHECKLISTS.md
  knowledge/live-2026-08-22/08-LACUNAS-E-ROADMAP.md
  knowledge/live-2026-08-22/99-FONTES-LACUNAS-E-CONTROLE-DE-VERSAO.md
)

for relative_path in "${required[@]}" "${runtime_knowledge[@]}"; do
  test -f "$root/$relative_path"
done

if test -e "$root/reports/task-2-report.md"; then
  echo "legacy reports/task-2-report.md must not be tracked" >&2
  exit 1
fi
if ! grep -Fq "A skill validada é mais operacional que o GPT preservado" "$root/README.md"; then
  echo "validated README must state the demonstrated utility relationship" >&2
  exit 1
fi
if ! grep -Fq "baseline online congelada qualificou 2/6" "$root/README.md"; then
  echo "validated README must preserve the online-baseline qualification limit" >&2
  exit 1
fi

ruby "$validator"

fixture="$(mktemp -d)"
trap 'rm -rf "$fixture"' EXIT
cp -R "$root/." "$fixture/"
rm -rf "$fixture/.git"

expect_rejected() {
  local name="$1"
  if ruby "$fixture/scripts/validate-fiscal-skill.rb" >/dev/null 2>&1; then
    echo "expected Fiscal skill validator to reject $name" >&2
    return 1
  fi
}

mkdir -p "$fixture/reports"
printf '%s\n' '# Legacy task report' > "$fixture/reports/task-2-report.md"
expect_rejected "the legacy Task 2 report returning"
rm "$fixture/reports/task-2-report.md"

cp "$fixture/README.md" "$fixture/README.md.valid"
perl -0pi -e 's/A skill validada é mais operacional que o GPT preservado/A skill replica o GPT preservado/' "$fixture/README.md"
expect_rejected "a validated README without the demonstrated utility relationship"
mv "$fixture/README.md.valid" "$fixture/README.md"

cp "$fixture/README.md" "$fixture/README.md.valid"
perl -0pi -e 's/baseline online congelada qualificou 2\/6/baseline online foi aprovada/' "$fixture/README.md"
expect_rejected "a validated README hiding the online-baseline qualification limit"
mv "$fixture/README.md.valid" "$fixture/README.md"

cp "$fixture/SKILL.md" "$fixture/SKILL.md.valid"
rm "$fixture/SKILL.md"
expect_rejected "a package without SKILL.md"
mv "$fixture/SKILL.md.valid" "$fixture/SKILL.md"

cp "$fixture/SKILL.md" "$fixture/SKILL.md.valid"
sed '2s/: /: [/' "$fixture/SKILL.md.valid" > "$fixture/SKILL.md"
expect_rejected "invalid SKILL.md frontmatter"
mv "$fixture/SKILL.md.valid" "$fixture/SKILL.md"

cp "$fixture/agents/openai.yaml" "$fixture/openai.yaml.valid"
dollar='$'
sed "s/\\${dollar}ac-fiscal/${dollar}outra-skill/" \
  "$fixture/openai.yaml.valid" > "$fixture/agents/openai.yaml"
expect_rejected "an interface prompt for another skill"
mv "$fixture/openai.yaml.valid" "$fixture/agents/openai.yaml"

for pointer in entrypoint interface source_policy fiscal_outputs approval_policy; do
  cp "$fixture/agent.yaml" "$fixture/agent.yaml.valid"
  awk -v pointer="$pointer" '
    /^skill_runtime:/ { in_runtime = 1 }
    in_runtime && $0 ~ "^  " pointer ":" {
      print "  " pointer ": WRONG"
      in_runtime = 0
      next
    }
    { print }
  ' "$fixture/agent.yaml.valid" > "$fixture/agent.yaml"
  expect_rejected "an incorrect skill_runtime.$pointer"
  mv "$fixture/agent.yaml.valid" "$fixture/agent.yaml"
done

knowledge_fixture="knowledge/live-2026-08-22/01-REGRAS-DE-USO-E-LIMITES.md"
cp "$fixture/$knowledge_fixture" "$fixture/knowledge.valid"
perl -0pi -e 's/Fiscal/fiscal/' "$fixture/$knowledge_fixture"
expect_rejected "same-size runtime Knowledge hash drift"
mv "$fixture/knowledge.valid" "$fixture/$knowledge_fixture"

cp "$fixture/$knowledge_fixture" "$fixture/knowledge.valid"
printf x >> "$fixture/$knowledge_fixture"
expect_rejected "runtime Knowledge size drift"
mv "$fixture/knowledge.valid" "$fixture/$knowledge_fixture"

cp "$fixture/agent.yaml" "$fixture/agent.yaml.valid"
sed '\|knowledge/live-2026-08-22/99-FONTES-LACUNAS-E-CONTROLE-DE-VERSAO.md|d' \
  "$fixture/agent.yaml.valid" > "$fixture/agent.yaml"
expect_rejected "a runtime missing one canonical Fiscal file"
mv "$fixture/agent.yaml.valid" "$fixture/agent.yaml"

cp "$fixture/agent.yaml" "$fixture/agent.yaml.valid"
awk '
  { print }
  /knowledge\/live-2026-08-22\/99-FONTES-LACUNAS-E-CONTROLE-DE-VERSAO.md/ && !added {
    print "    - knowledge/original/01-REGRAS-DE-USO-E-LIMITES.md"
    added = 1
  }
' "$fixture/agent.yaml.valid" > "$fixture/agent.yaml"
expect_rejected "a DP-contaminated original in the runtime allowlist"
mv "$fixture/agent.yaml.valid" "$fixture/agent.yaml"

cp "$fixture/agent.yaml" "$fixture/agent.yaml.valid"
awk '
  /^  package:[[:space:]]*$/ { in_package = 1 }
  { print }
  in_package && /knowledge\/live-2026-08-22\/99-FONTES-LACUNAS-E-CONTROLE-DE-VERSAO.md/ && !added {
    print "    - evaluations/source-capture.md"
    added = 1
  }
' "$fixture/agent.yaml.valid" > "$fixture/agent.yaml"
expect_rejected "a non-runtime file in the package allowlist"
mv "$fixture/agent.yaml.valid" "$fixture/agent.yaml"

cp "$fixture/references/source-policy.md" "$fixture/source-policy.valid"
perl -0pi -e 's/LACUNA DE FONTE OFICIAL/FONTE PENDENTE/g' \
  "$fixture/references/source-policy.md"
expect_rejected "a source policy without the official-source gap marker"
mv "$fixture/source-policy.valid" "$fixture/references/source-policy.md"

cp "$fixture/SKILL.md" "$fixture/SKILL.md.valid"
perl -0pi -e 's/\n## Aprovação e execução externa\n.*\z/\n/s' \
  "$fixture/SKILL.md"
expect_rejected "an entrypoint without the materialized action-state contract"
mv "$fixture/SKILL.md.valid" "$fixture/SKILL.md"

cp "$fixture/references/fiscal-outputs.md" "$fixture/fiscal-outputs.valid"
perl -0pi -e \
  's/Não gere, pague nem transmita guia\./Depois da revisão, emita a guia./' \
  "$fixture/references/fiscal-outputs.md"
expect_rejected "a pre-assessment route that allows guide execution after review"
mv "$fixture/fiscal-outputs.valid" "$fixture/references/fiscal-outputs.md"

cp "$fixture/references/fiscal-outputs.md" "$fixture/fiscal-outputs.valid"
perl -0pi -e 's/NO TURNO ATUAL/EM OUTRO TURNO/' \
  "$fixture/references/fiscal-outputs.md"
expect_rejected "a classification route that defers its matrix"
mv "$fixture/fiscal-outputs.valid" "$fixture/references/fiscal-outputs.md"

cp "$fixture/references/fiscal-outputs.md" "$fixture/fiscal-outputs.valid"
perl -0pi -e \
  's/parametrizar, alterar, importar, emitir ou\s+outra mutação de ERP\/sistema/planejar uma ação futura/' \
  "$fixture/references/fiscal-outputs.md"
expect_rejected "a Reforma handoff without the planned-ERP mutation gate"
mv "$fixture/fiscal-outputs.valid" "$fixture/references/fiscal-outputs.md"

cp "$fixture/references/fiscal-outputs.md" "$fixture/fiscal-outputs.valid"
perl -0pi -e \
  's/(## `\/reforma-handoff`.*?  - )`PREPARAR —`/$1PREPARAR OMITIDO/s' \
  "$fixture/references/fiscal-outputs.md"
expect_rejected "a Reforma handoff whose own operational branch omits PREPARAR"
mv "$fixture/fiscal-outputs.valid" "$fixture/references/fiscal-outputs.md"

cp "$fixture/references/fiscal-outputs.md" "$fixture/fiscal-outputs.valid"
perl -0pi -e \
  's/(## `\/reforma-handoff`.*?GATE HUMANO —` aprovação explícita )imediatamente antes da ação exata/$1em momento posterior/s' \
  "$fixture/references/fiscal-outputs.md"
expect_rejected "a Reforma handoff whose own gate is not immediately before the action"
mv "$fixture/fiscal-outputs.valid" "$fixture/references/fiscal-outputs.md"

cp "$fixture/references/approval-policy.md" "$fixture/approval-policy.valid"
perl -0pi -e \
  's/Aprovação de plano, estimativa, pré-apuração,\s+revisão técnica, recorrência ou ação anterior não autoriza a execução atual, o\s+reenvio nem a próxima ação\./A revisão técnica autoriza a execução futura./s' \
  "$fixture/references/approval-policy.md"
expect_rejected "an approval policy that treats review as execution authorization"
mv "$fixture/approval-policy.valid" "$fixture/references/approval-policy.md"

cp "$fixture/references/approval-policy.md" "$fixture/approval-policy.valid"
perl -0pi -e 's/imediatamente antes de cada/imediatamente antes de alguma/g' \
  "$fixture/references/approval-policy.md"
expect_rejected "an approval policy that does not gate every exact action"
mv "$fixture/approval-policy.valid" "$fixture/references/approval-policy.md"

cp "$fixture/evaluations/parity/questions.yaml" "$fixture/questions.valid"
sed '/^  - id: P6$/,$d' "$fixture/questions.valid" > \
  "$fixture/evaluations/parity/questions.yaml"
expect_rejected "fewer than six parity cases"
mv "$fixture/questions.valid" "$fixture/evaluations/parity/questions.yaml"

cp "$fixture/evaluations/rubrics/behavior.md" "$fixture/rubric.valid"
perl -0pi -e 's/passing_score: 10/passing_score: 9/' \
  "$fixture/evaluations/rubrics/behavior.md"
expect_rejected "a rubric below the 10 of 12 gate"
mv "$fixture/rubric.valid" "$fixture/evaluations/rubrics/behavior.md"

cp "$fixture/agent.yaml" "$fixture/agent.yaml.valid"
sed 's/^  lifecycle: validated$/  lifecycle: candidate/' \
  "$fixture/agent.yaml.valid" > "$fixture/agent.yaml"
expect_rejected "a lifecycle regression to candidate"
mv "$fixture/agent.yaml.valid" "$fixture/agent.yaml"

cp "$fixture/agents/openai.yaml" "$fixture/openai.yaml.valid"
cat >> "$fixture/agents/openai.yaml" <<'YAML'
dependencies:
  tools:
    - type: "mcp"
      value: "invented"
YAML
expect_rejected "an invented runtime tool dependency"
mv "$fixture/openai.yaml.valid" "$fixture/agents/openai.yaml"

echo "Fiscal skill validator tests passed"
