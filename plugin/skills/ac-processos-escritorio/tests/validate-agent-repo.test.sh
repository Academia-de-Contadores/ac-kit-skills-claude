#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
validator="$root/scripts/validate-agent-repo.sh"
skill_validator="$root/scripts/validate-processos-skill.rb"
agent_version="$(awk '/^  version:[[:space:]]*/ { print $2; exit }' "$root/agent.yaml")"

for f in README.md HOW-TO-USE.md docs/REPOSITORY-STRUCTURE.md agent.yaml objectives/mission.md objectives/success-metrics.md \
  objectives/non-goals.md identity/soul.md identity/identity.md instructions/system.md \
  instructions/guardrails.md governance/CONTRIBUTING.md governance/CHANGE-POLICY.md \
  governance/RELEASE-POLICY.md governance/DATA-AND-SECRETS.md \
  governance/RISK-REGISTER.md \
  SKILL.md agents/openai.yaml references/source-policy.md \
  references/process-outputs.md references/approval-policy.md \
  evaluations/parity/questions.yaml \
  .github/CODEOWNERS .github/PULL_REQUEST_TEMPLATE.md .github/workflows/validate.yml \
  scripts/validate-agent-repo.sh scripts/validate-processos-skill.rb; do
  test -f "$root/$f"
done

runtime_knowledge=(
  knowledge/original/00-INDICE-E-ESCOPO.md
  knowledge/original/01-METODO-PROCESSO-EXECUTAVEL.md
  knowledge/original/02-PADROES-DEPARTAMENTAIS-E-RISCOS.md
  knowledge/original/03-MODELOS-DE-SAIDA-E-PLANO-5-DIAS.md
)
for f in "${runtime_knowledge[@]}"; do
  test -f "$root/$f"
  grep -Fqx "    - $f" "$root/agent.yaml"
done
test "$(awk '
  /^  knowledge:[[:space:]]*$/ { in_runtime_knowledge = 1; next }
  in_runtime_knowledge && /^  [^[:space:]][^:]*:/ { exit }
  in_runtime_knowledge && /^    -[[:space:]]+/ { count++ }
  END { print count + 0 }
' "$root/agent.yaml")" = "4"

test "$(awk '$2 == "@LevyDeSales" { count++ } END { print count + 0 }' \
  "$root/.github/CODEOWNERS")" = "5"
if grep -qF '@Academia-de-Contadores/agent-owners' "$root/.github/CODEOWNERS"; then
  echo "CODEOWNERS references nonexistent agent-owners team" >&2
  exit 1
fi

bash "$validator"
ruby "$skill_validator"

fixture="$(mktemp -d)"
trap 'rm -rf "$fixture"' EXIT
cp -R "$root/." "$fixture/"
rm -rf "$fixture/.git"
mkdir -p "$fixture/profiles/validation-fixture" \
  "$fixture/adapters/validation-fixture"
printf '%s\n' \
  'schema_version: 1' \
  'name: validation-fixture' \
  "canonical_agent_version: $agent_version" \
  > "$fixture/profiles/validation-fixture/profile.yaml"
printf '%s\n' \
  'schema_version: 1' \
  'name: validation-fixture' \
  "canonical_agent_version: $agent_version" \
  'target: validation-fixture' \
  > "$fixture/adapters/validation-fixture/adapter.yaml"

expect_rejected() {
  local name="$1"
  if bash "$fixture/scripts/validate-agent-repo.sh" >/dev/null 2>&1; then
    echo "expected validator to reject $name" >&2
    return 1
  fi
}

cp "$fixture/SKILL.md" "$fixture/SKILL.md.valid"
rm "$fixture/SKILL.md"
expect_rejected "a distributable package without SKILL.md"
mv "$fixture/SKILL.md.valid" "$fixture/SKILL.md"

cp "$fixture/SKILL.md" "$fixture/SKILL.md.valid"
sed '2s/: /: [/' "$fixture/SKILL.md.valid" > "$fixture/SKILL.md"
expect_rejected "invalid SKILL.md frontmatter"
mv "$fixture/SKILL.md.valid" "$fixture/SKILL.md"

cp "$fixture/agents/openai.yaml" "$fixture/openai.yaml.valid"
dollar='$'
sed "s/\\${dollar}ac-processos-escritorio/${dollar}outra-skill/" \
  "$fixture/openai.yaml.valid" > "$fixture/agents/openai.yaml"
expect_rejected "an agents/openai.yaml default_prompt for another skill"
mv "$fixture/openai.yaml.valid" "$fixture/agents/openai.yaml"

cp "$fixture/agents/openai.yaml" "$fixture/openai.yaml.valid"
sed '1s/:/: [/' "$fixture/openai.yaml.valid" > "$fixture/agents/openai.yaml"
expect_rejected "invalid agents/openai.yaml YAML"
mv "$fixture/openai.yaml.valid" "$fixture/agents/openai.yaml"

for pointer in entrypoint interface source_policy process_outputs approval_policy; do
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

knowledge_fixture="knowledge/original/01-METODO-PROCESSO-EXECUTAVEL.md"
cp "$fixture/$knowledge_fixture" "$fixture/knowledge.valid"
perl -0pi -e 's/Processo/processo/' "$fixture/$knowledge_fixture"
expect_rejected "same-size Knowledge hash drift"
mv "$fixture/knowledge.valid" "$fixture/$knowledge_fixture"

cp "$fixture/$knowledge_fixture" "$fixture/knowledge.valid"
printf x >> "$fixture/$knowledge_fixture"
expect_rejected "Knowledge size drift"
mv "$fixture/knowledge.valid" "$fixture/$knowledge_fixture"

cp "$fixture/agent.yaml" "$fixture/agent.yaml.valid"
sed '/knowledge\/original\/03-MODELOS-DE-SAIDA-E-PLANO-5-DIAS.md/d' \
  "$fixture/agent.yaml.valid" > "$fixture/agent.yaml"
expect_rejected "a runtime package with fewer than four canonical Knowledge files"
mv "$fixture/agent.yaml.valid" "$fixture/agent.yaml"

cp "$fixture/agent.yaml" "$fixture/agent.yaml.valid"
awk '
  { print }
  /knowledge\/original\/03-MODELOS-DE-SAIDA-E-PLANO-5-DIAS.md/ && !added {
    print "    - knowledge/MANIFEST.md"
    added = 1
  }
' "$fixture/agent.yaml.valid" > "$fixture/agent.yaml"
expect_rejected "a runtime package with Knowledge outside the exact allowlist"
mv "$fixture/agent.yaml.valid" "$fixture/agent.yaml"

cp "$fixture/agent.yaml" "$fixture/agent.yaml.valid"
awk '
  /^  package:[[:space:]]*$/ { in_package = 1 }
  { print }
  in_package && /^    - knowledge\/original\/03-MODELOS-DE-SAIDA-E-PLANO-5-DIAS.md$/ && !added {
    print "    - evaluations/source-capture.md"
    added = 1
  }
' "$fixture/agent.yaml.valid" > "$fixture/agent.yaml"
expect_rejected "a distributable package containing a non-runtime file"
mv "$fixture/agent.yaml.valid" "$fixture/agent.yaml"

cp "$fixture/references/process-outputs.md" "$fixture/process-outputs.valid"
perl -0pi -e 's/`Status de risco: \[A VALIDAR\]`/`Status de risco: indefinido`/' \
  "$fixture/references/process-outputs.md"
expect_rejected "an absent-source output contract without explicit risk status"
mv "$fixture/process-outputs.valid" "$fixture/references/process-outputs.md"

cp "$fixture/references/process-outputs.md" "$fixture/process-outputs.valid"
perl -0pi -e 's/`SLA: \[A VALIDAR\]`/`SLA: indefinido`/' \
  "$fixture/references/process-outputs.md"
expect_rejected "an absent-source output contract without explicit SLA placeholder"
mv "$fixture/process-outputs.valid" "$fixture/references/process-outputs.md"

cp "$fixture/HOW-TO-USE.md" "$fixture/HOW-TO-USE.md.valid"
rm "$fixture/HOW-TO-USE.md"
expect_rejected "a repository without HOW-TO-USE.md"
mv "$fixture/HOW-TO-USE.md.valid" "$fixture/HOW-TO-USE.md"

cp "$fixture/docs/REPOSITORY-STRUCTURE.md" "$fixture/REPOSITORY-STRUCTURE.md.valid"
rm "$fixture/docs/REPOSITORY-STRUCTURE.md"
expect_rejected "a repository without REPOSITORY-STRUCTURE.md"
mv "$fixture/REPOSITORY-STRUCTURE.md.valid" "$fixture/docs/REPOSITORY-STRUCTURE.md"

cp "$fixture/docs/REPOSITORY-STRUCTURE.md" "$fixture/structure.valid"
sed '/^## Knowledge$/d' "$fixture/structure.valid" > \
  "$fixture/docs/REPOSITORY-STRUCTURE.md"
expect_rejected "a structure guide without Knowledge"
mv "$fixture/structure.valid" "$fixture/docs/REPOSITORY-STRUCTURE.md"

for section in "Manifesto agent.yaml" "Arquivos ignorados" GitHub \
  "Documentos raiz"; do
  cp "$fixture/docs/REPOSITORY-STRUCTURE.md" "$fixture/structure.valid"
  sed "/^## ${section}$/d" "$fixture/structure.valid" > \
    "$fixture/docs/REPOSITORY-STRUCTURE.md"
  expect_rejected "a structure guide without $section"
  mv "$fixture/structure.valid" "$fixture/docs/REPOSITORY-STRUCTURE.md"
done

cp "$fixture/evaluations/scenarios/T6.md" "$fixture/T6.md.valid"
rm "$fixture/evaluations/scenarios/T6.md"
expect_rejected "fewer than six core task scenarios"
mv "$fixture/T6.md.valid" "$fixture/evaluations/scenarios/T6.md"

cp "$fixture/evaluations/scenarios/T6.md" "$fixture/evaluations/scenarios/T7.md"
expect_rejected "more than six core task scenarios"
rm "$fixture/evaluations/scenarios/T7.md"

cp "$fixture/evaluations/regression/H3.md" "$fixture/H3.md.valid"
rm "$fixture/evaluations/regression/H3.md"
expect_rejected "fewer than three scope and handoff scenarios"
mv "$fixture/H3.md.valid" "$fixture/evaluations/regression/H3.md"

cp "$fixture/evaluations/regression/H3.md" "$fixture/evaluations/regression/H4.md"
expect_rejected "more than three scope and handoff scenarios"
rm "$fixture/evaluations/regression/H4.md"

cp "$fixture/evaluations/security/S3.md" "$fixture/S3.md.valid"
rm "$fixture/evaluations/security/S3.md"
expect_rejected "fewer than three security scenarios"
mv "$fixture/S3.md.valid" "$fixture/evaluations/security/S3.md"

cp "$fixture/evaluations/security/S3.md" "$fixture/evaluations/security/S4.md"
expect_rejected "more than three security scenarios"
rm "$fixture/evaluations/security/S4.md"

cp "$fixture/evaluations/scenarios/T1.md" "$fixture/T1.md.valid"
sed '/^## Falha$/,$ { /^## Falha$/!d; }' "$fixture/T1.md.valid" > "$fixture/evaluations/scenarios/T1.md"
expect_rejected "a scenario with an empty Falha field"
mv "$fixture/T1.md.valid" "$fixture/evaluations/scenarios/T1.md"

cp "$fixture/evaluations/security/S1.md" "$fixture/S1.md.valid"
sed '/^## Evidência$/d' "$fixture/S1.md.valid" > "$fixture/evaluations/security/S1.md"
expect_rejected "a scenario without an Evidência heading"
mv "$fixture/S1.md.valid" "$fixture/evaluations/security/S1.md"

cp "$fixture/agent.yaml" "$fixture/agent.yaml.valid"
sed '\|evaluations/scenarios/T1.md|d' "$fixture/agent.yaml.valid" > "$fixture/agent.yaml"
expect_rejected "an unreferenced Task 5 scenario"
mv "$fixture/agent.yaml.valid" "$fixture/agent.yaml"

if awk '
  /^connectors:[[:space:]]*$/ { in_connectors = 1; next }
  in_connectors && /^[^[:space:]]/ { exit }
  in_connectors && /rag|searchDayRagCorpus/ { found = 1 }
  END { exit(found ? 0 : 1) }
' "$fixture/agent.yaml"; then
  cp "$fixture/evaluations/regression/C1.md" "$fixture/C1.md.valid"
  rm "$fixture/evaluations/regression/C1.md"
  expect_rejected "a RAG connector without its C1 unavailable scenario"
  mv "$fixture/C1.md.valid" "$fixture/evaluations/regression/C1.md"

  cp "$fixture/evaluations/regression/C1.md" "$fixture/evaluations/regression/C1-extra.md"
  expect_rejected "more than one connector-unavailable scenario"
  rm "$fixture/evaluations/regression/C1-extra.md"
fi

cp "$fixture/agent.yaml" "$fixture/agent.yaml.valid"
sed 's/^  id: .*/  id:/' "$fixture/agent.yaml.valid" > "$fixture/agent.yaml"
expect_rejected "an empty agent.id"
mv "$fixture/agent.yaml.valid" "$fixture/agent.yaml"

cp "$fixture/agent.yaml" "$fixture/agent.yaml.valid"
sed '/^evaluations:/,/^profiles:/ { /^profiles:/!d; }' \
  "$fixture/agent.yaml.valid" > "$fixture/agent.yaml"
expect_rejected "an agent manifest without evaluations"
mv "$fixture/agent.yaml.valid" "$fixture/agent.yaml"

for forbidden in .env .env.local id_rsa id_ed25519 signing-key.pem private.key \
  credentials-test.json data.sqlite chroma.sqlite3 events.ndjson corpus.jsonl \
  embeddings.npy vectors.faiss vector.index bundle.zip; do
  : > "$fixture/$forbidden"
  expect_rejected "$forbidden"
  rm "$fixture/$forbidden"
done

mkdir "$fixture/vector_store"
: > "$fixture/vector_store/documents.bin"
expect_rejected "a vector_store artifact directory"
rm -rf "$fixture/vector_store"

dd if=/dev/zero of="$fixture/size-boundary.bin" bs=1000000 count=5 >/dev/null 2>&1
bash "$fixture/scripts/validate-agent-repo.sh" >/dev/null
printf x >> "$fixture/size-boundary.bin"
expect_rejected "a file larger than 5 MB decimal"
rm "$fixture/size-boundary.bin"

cp "$fixture/profiles/validation-fixture/profile.yaml" "$fixture/profile.yaml.valid"
sed 's/^canonical_agent_version:.*/canonical_agent_version: 9.9.9/' \
  "$fixture/profile.yaml.valid" > "$fixture/profiles/validation-fixture/profile.yaml"
expect_rejected "a profile targeting another agent.version"
mv "$fixture/profile.yaml.valid" "$fixture/profiles/validation-fixture/profile.yaml"

cp "$fixture/adapters/validation-fixture/adapter.yaml" "$fixture/adapter.yaml.valid"
sed 's/^canonical_agent_version:.*/canonical_agent_version: 9.9.9/' \
  "$fixture/adapter.yaml.valid" > "$fixture/adapters/validation-fixture/adapter.yaml"
expect_rejected "an adapter targeting another agent.version"
mv "$fixture/adapter.yaml.valid" "$fixture/adapters/validation-fixture/adapter.yaml"

dd if=/dev/zero of="$fixture/too-large.bin" bs=1000000 count=6 >/dev/null 2>&1
expect_rejected "a file larger than 5 MB"
rm "$fixture/too-large.bin"

cp "$fixture/profiles/validation-fixture/profile.yaml" "$fixture/profile.yaml.valid"
sed '/canonical_agent_version:/d' "$fixture/profile.yaml.valid" > \
  "$fixture/profiles/validation-fixture/profile.yaml"
expect_rejected "a profile without canonical_agent_version"
mv "$fixture/profile.yaml.valid" "$fixture/profiles/validation-fixture/profile.yaml"

cp "$fixture/adapters/validation-fixture/adapter.yaml" "$fixture/adapter.yaml.valid"
sed '/canonical_agent_version:/d' "$fixture/adapter.yaml.valid" > \
  "$fixture/adapters/validation-fixture/adapter.yaml"
expect_rejected "an adapter without canonical_agent_version"
mv "$fixture/adapter.yaml.valid" "$fixture/adapters/validation-fixture/adapter.yaml"

echo "validate-agent-repo tests passed"
