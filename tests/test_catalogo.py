import importlib.util, unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("check_catalogo", ROOT / "scripts" / "check_catalogo.py")
check = importlib.util.module_from_spec(spec)
spec.loader.exec_module(check)


class CatalogoTest(unittest.TestCase):
    def test_catalogo_e_qualidade_sem_erros(self):
        erros, _, linhas = check.conferir()
        self.assertEqual(erros, [], "\n".join(erros))
        self.assertEqual(len(linhas), len([p for p in check.SKILLS.iterdir() if p.is_dir()]))

    def test_readme_em_dia_com_o_catalogo(self):
        texto = check.README.read_text()
        bloco = texto.split(check.INICIO, 1)[1].split(check.FIM, 1)[0]
        self.assertEqual(check.INICIO + bloco + check.FIM, check.bloco_readme(),
                         "Rode python3 scripts/check_catalogo.py --atualizar-readme")

    def test_detecta_caminho_absoluto(self):
        self.assertTrue(check.CAMINHO_ABSOLUTO.search("rodei em /Users/alguem/pasta"))
        self.assertFalse(check.CAMINHO_ABSOLUTO.search('if text.include?("/Users/")'))
        self.assertFalse(check.CAMINHO_ABSOLUTO.search("~/.codex/skills/ac-fiscal"))


if __name__ == "__main__":
    unittest.main()
