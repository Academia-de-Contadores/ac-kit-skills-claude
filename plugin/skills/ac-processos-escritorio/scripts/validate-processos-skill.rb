# frozen_string_literal: true

require "date"
require "digest"
require "pathname"
require "yaml"

ROOT = Pathname.new(__dir__).join("..").expand_path
SKILL_NAME = "ac-processos-escritorio"
RUNTIME_KNOWLEDGE = [
  "knowledge/original/00-INDICE-E-ESCOPO.md",
  "knowledge/original/01-METODO-PROCESSO-EXECUTAVEL.md",
  "knowledge/original/02-PADROES-DEPARTAMENTAIS-E-RISCOS.md",
  "knowledge/original/03-MODELOS-DE-SAIDA-E-PLANO-5-DIAS.md"
].freeze
KNOWLEDGE_INTEGRITY = {
  "knowledge/original/00-INDICE-E-ESCOPO.md" => {
    bytes: 2413,
    sha256: "8f3461074c4a0ed0c1aa55ab2139b2d2be362f990bce5a9c8624c839677852bf"
  },
  "knowledge/original/01-METODO-PROCESSO-EXECUTAVEL.md" => {
    bytes: 3509,
    sha256: "1a3021e1374f2bcfe55f1e2f5b91f27152090252d18c612388f4773ceadfd5d9"
  },
  "knowledge/original/02-PADROES-DEPARTAMENTAIS-E-RISCOS.md" => {
    bytes: 4533,
    sha256: "f1dca8545e265739dfdb3be626221578eeb16c076657292d7cc3dca6b649c001"
  },
  "knowledge/original/03-MODELOS-DE-SAIDA-E-PLANO-5-DIAS.md" => {
    bytes: 3658,
    sha256: "1a60d3ce068d16857824978a9e6cb39d6f616963dcb87f55e5a8dde3e31b0ccc"
  }
}.freeze
PACKAGE_FILES = [
  "SKILL.md",
  "agent.yaml",
  "agents/openai.yaml",
  "references/source-policy.md",
  "references/process-outputs.md",
  "references/approval-policy.md",
  "identity/identity.md",
  "identity/soul.md",
  "objectives/mission.md",
  "objectives/non-goals.md",
  "objectives/success-metrics.md",
  "instructions/guardrails.md",
  "instructions/system.md",
  *RUNTIME_KNOWLEDGE
].freeze
RUNTIME_POINTERS = {
  "name" => SKILL_NAME,
  "entrypoint" => "SKILL.md",
  "interface" => "agents/openai.yaml",
  "source_policy" => "references/source-policy.md",
  "process_outputs" => "references/process-outputs.md",
  "approval_policy" => "references/approval-policy.md"
}.freeze

def fail_validation(message)
  warn "skill validation error: #{message}"
  exit 1
end

def load_yaml(relative_path)
  path = ROOT.join(relative_path)
  value = YAML.safe_load(
    path.read(encoding: "UTF-8"),
    permitted_classes: [Date],
    permitted_symbols: [],
    aliases: false
  )
  fail_validation("#{relative_path} must contain a YAML mapping") unless value.is_a?(Hash)
  value
rescue Errno::ENOENT
  fail_validation("missing #{relative_path}")
rescue Psych::Exception => e
  fail_validation("invalid YAML in #{relative_path}: #{e.message.lines.first.strip}")
end

def load_frontmatter(relative_path)
  text = ROOT.join(relative_path).read(encoding: "UTF-8")
  match = text.match(/\A---\r?\n(.*?)\r?\n---(?:\r?\n|\z)/m)
  fail_validation("#{relative_path} has invalid or missing YAML frontmatter") unless match

  value = YAML.safe_load(
    match[1],
    permitted_classes: [],
    permitted_symbols: [],
    aliases: false
  )
  fail_validation("#{relative_path} frontmatter must be a mapping") unless value.is_a?(Hash)
  value
rescue Errno::ENOENT
  fail_validation("missing #{relative_path}")
rescue Psych::Exception => e
  fail_validation("invalid YAML in #{relative_path} frontmatter: #{e.message.lines.first.strip}")
end

skill_frontmatter = load_frontmatter("SKILL.md")
unexpected_keys = skill_frontmatter.keys - %w[name description license allowed-tools metadata]
unless unexpected_keys.empty?
  fail_validation("unexpected SKILL.md frontmatter keys: #{unexpected_keys.join(', ')}")
end
unless skill_frontmatter["name"] == SKILL_NAME
  fail_validation("SKILL.md frontmatter name must be #{SKILL_NAME}")
end
description = skill_frontmatter["description"]
unless description.is_a?(String) && description.start_with?("Use when ") && description.length <= 1024
  fail_validation("SKILL.md description must start with 'Use when ' and contain at most 1024 characters")
end
if description.include?("<") || description.include?(">") || description.include?("TODO")
  fail_validation("SKILL.md description contains a placeholder or angle bracket")
end

agent = load_yaml("agent.yaml")
unless agent.dig("agent", "version") == "0.2.0" && agent.dig("agent", "lifecycle") == "validated"
  fail_validation("agent.yaml must declare version 0.2.0 with lifecycle validated")
end
fail_validation("agent.yaml connectors must remain empty") unless agent["connectors"] == []

runtime = agent["skill_runtime"]
fail_validation("agent.yaml skill_runtime must be a mapping") unless runtime.is_a?(Hash)
RUNTIME_POINTERS.each do |key, expected|
  fail_validation("agent.yaml skill_runtime.#{key} must be #{expected}") unless runtime[key] == expected
end
unless runtime["knowledge"] == RUNTIME_KNOWLEDGE
  fail_validation("agent.yaml skill_runtime.knowledge must preserve the exact four-file allowlist and order")
end
unless runtime["package"] == PACKAGE_FILES
  fail_validation("agent.yaml skill_runtime.package must preserve the exact distributable allowlist and order")
end

process_outputs = ROOT.join("references/process-outputs.md").read(encoding: "UTF-8")
absent_source_contract = process_outputs.split("## `/mapa`", 2).first
unless absent_source_contract.include?("`Status de risco: [A VALIDAR]`")
  fail_validation("absent-source outputs must record explicit risk status")
end
unless absent_source_contract.include?("`SLA: [A VALIDAR]`")
  fail_validation("absent-source outputs must record the explicit SLA placeholder")
end

skills = agent["skills"]
skill_entry = skills.is_a?(Array) && skills.find do |entry|
  entry.is_a?(Hash) && entry["id"] == SKILL_NAME
end
fail_validation("agent.yaml skills must declare #{SKILL_NAME}") unless skill_entry
unless skill_entry["entrypoint"] == "SKILL.md" && skill_entry["interface"] == "agents/openai.yaml"
  fail_validation("agent.yaml skills entrypoint/interface must point to the distributable package")
end
expected_references = %w[
  references/source-policy.md
  references/process-outputs.md
  references/approval-policy.md
]
unless skill_entry["references"] == expected_references
  fail_validation("agent.yaml skills references must preserve the exact policy set and order")
end

PACKAGE_FILES.each do |relative_path|
  path = ROOT.join(relative_path)
  fail_validation("missing distributable file: #{relative_path}") unless path.file?
  fail_validation("distributable file must not be a symlink: #{relative_path}") if path.symlink?
end

openai = load_yaml("agents/openai.yaml")
interface = openai["interface"]
fail_validation("agents/openai.yaml interface must be a mapping") unless interface.is_a?(Hash)
%w[display_name short_description default_prompt].each do |field|
  value = interface[field]
  unless value.is_a?(String) && !value.strip.empty?
    fail_validation("agents/openai.yaml interface.#{field} must be a nonempty string")
  end
end
unless interface["short_description"].length.between?(25, 64)
  fail_validation("agents/openai.yaml interface.short_description must contain 25 to 64 characters")
end
unless interface["default_prompt"].include?("$#{SKILL_NAME}")
  fail_validation("agents/openai.yaml interface.default_prompt must mention $#{SKILL_NAME}")
end
unless openai.dig("policy", "allow_implicit_invocation") == true
  fail_validation("agents/openai.yaml policy.allow_implicit_invocation must be true")
end
fail_validation("agents/openai.yaml must not invent tool dependencies") if openai.key?("dependencies")

manifest_entries = {}
ROOT.join("knowledge/MANIFEST.md").each_line(encoding: "UTF-8") do |line|
  match = line.match(/^\|\s*`([^`]+)`\s*\|\s*`([0-9a-f]{64})`\s*\|\s*(\d+)\s*\|\s*$/)
  next unless match

  relative_path = match[1].start_with?("knowledge/") ? match[1] : "knowledge/#{match[1]}"
  manifest_entries[relative_path] = { sha256: match[2], bytes: match[3].to_i }
end
unless manifest_entries == KNOWLEDGE_INTEGRITY
  fail_validation("knowledge/MANIFEST.md must preserve the exact 2026-08-07 hashes and sizes")
end

KNOWLEDGE_INTEGRITY.each do |relative_path, expected|
  path = ROOT.join(relative_path)
  fail_validation("missing runtime Knowledge file: #{relative_path}") unless path.file?
  actual_bytes = path.size
  actual_sha256 = Digest::SHA256.file(path).hexdigest
  unless actual_bytes == expected[:bytes]
    fail_validation("Knowledge size drift for #{relative_path}: expected #{expected[:bytes]}, got #{actual_bytes}")
  end
  unless actual_sha256 == expected[:sha256]
    fail_validation("Knowledge SHA-256 drift for #{relative_path}: expected #{expected[:sha256]}, got #{actual_sha256}")
  end
end

questions = load_yaml("evaluations/parity/questions.yaml")
unless questions.dig("gpt", "id") == "g-6a725900102c8191bdcb028b9ab4f21a"
  fail_validation("parity questions must target the canonical GPT id")
end
unless questions.dig("skill", "id") == SKILL_NAME
  fail_validation("parity questions must target #{SKILL_NAME}")
end
cases = questions["cases"]
unless cases.is_a?(Array) && cases.map { |item| item["id"] } == %w[P1 P2 P3 P4 P5 P6]
  fail_validation("parity questions must contain exactly P1 through P6 in order")
end
cases.each do |item|
  unless item["prompt"].is_a?(String) && !item["prompt"].strip.empty? &&
         item["baseline_expected"].is_a?(Array) && !item["baseline_expected"].empty? &&
         item["skill_extension"].is_a?(Array) && !item["skill_extension"].empty?
    fail_validation("parity case #{item['id']} must define prompt, baseline_expected and skill_extension")
  end
end

rubric = load_frontmatter("evaluations/rubrics/behavior.md")
expected_dimensions = %w[
  grounding
  executability
  roles-and-dependencies
  evidence-risk-and-sla
  handoff-and-deliverable
  safety-and-approval
]
unless rubric["dimensions"] == expected_dimensions &&
       rubric.dig("score_per_dimension", "minimum") == 0 &&
       rubric.dig("score_per_dimension", "maximum") == 2 &&
       rubric["passing_score"] == 10 && rubric["maximum_score"] == 12
  fail_validation("behavior rubric must define six 0-2 dimensions and a 10/12 passing score")
end
expected_gates = %w[
  no-fabrication
  human-approval-for-external-actions
  untrusted-content-resistance
  no-scenario-failure
]
unless rubric["mandatory_gates"] == expected_gates
  fail_validation("behavior rubric must preserve all mandatory gates")
end

puts "Processos skill package validation passed"
