#!/usr/bin/env bash
set -euo pipefail

write_yaml() {
  local path="$1"
  local content="$2"
  mkdir -p "$(dirname "$path")"
  printf "%s\n" "$content" > "$path"
}

route_skill() {
  local base="$1"
  local skill="$2"
  local yaml="$3"
  if [ -d "$base/$skill" ]; then
    write_yaml "$base/$skill/agents/openai.yaml" "$yaml"
  fi
}

YAML_DEBUGGING_STRATEGIES="$(cat <<'YAML'
interface:
  display_name: "Debugging Strategies (Secondary)"
  short_description: "Secondary debugging skill; use $systematic-debugging first"
  default_prompt: "Use $debugging-strategies only when you need an alternative debugging perspective after $systematic-debugging."
policy:
  allow_implicit_invocation: false
YAML
)"

YAML_PARALLEL_DEBUGGING="$(cat <<'YAML'
interface:
  display_name: "Parallel Debugging (Secondary)"
  short_description: "Alternative ACH-style debugging; explicit invocation only"
  default_prompt: "Use $parallel-debugging for multi-hypothesis investigations that need parallel tracks."
policy:
  allow_implicit_invocation: false
YAML
)"

YAML_HYBRID_NETWORKING="$(cat <<'YAML'
interface:
  display_name: "Hybrid Cloud Networking (Secondary)"
  short_description: "Advanced hybrid networking; explicit invocation recommended"
  default_prompt: "Use $hybrid-cloud-networking for on-prem to cloud network architecture and migration planning."
policy:
  allow_implicit_invocation: false
YAML
)"

YAML_DOCKER_EXPERT="$(cat <<'YAML'
interface:
  display_name: "Docker Expert (Secondary)"
  short_description: "Deep Docker expertise; explicit invocation recommended"
  default_prompt: "Use $docker-expert for advanced Docker optimization and security hardening tasks."
policy:
  allow_implicit_invocation: false
YAML
)"

YAML_DEVOPS_ENGINEER="$(cat <<'YAML'
interface:
  display_name: "DevOps Engineer"
  short_description: "CI/CD and IaC workflows for production delivery"
  default_prompt: "Use $devops-engineer to design or improve CI/CD, IaC, and deployment workflows."
policy:
  allow_implicit_invocation: true
YAML
)"

for base in /home/lqd/.codex/skills /home/lqd/.agents/skills; do
  route_skill "$base" debugging-strategies "$YAML_DEBUGGING_STRATEGIES"
  route_skill "$base" parallel-debugging "$YAML_PARALLEL_DEBUGGING"
  route_skill "$base" hybrid-cloud-networking "$YAML_HYBRID_NETWORKING"
  route_skill "$base" docker-expert "$YAML_DOCKER_EXPERT"
  route_skill "$base" devops-engineer "$YAML_DEVOPS_ENGINEER"
done

echo "market routing applied"
