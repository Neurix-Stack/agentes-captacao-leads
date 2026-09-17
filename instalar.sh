#!/usr/bin/env bash
# Instala a skill "captar-leads" e os subagents que ela usa no Claude Code.
# Funciona no macOS, Linux, e no Git Bash do Windows.
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AGENTS_DEST="$HOME/.claude/agents"
SKILLS_DEST="$HOME/.claude/skills/captar-leads"

mkdir -p "$AGENTS_DEST" "$SKILLS_DEST"
cp "$SCRIPT_DIR/.claude/agents/lead-finder.md" "$AGENTS_DEST/lead-finder.md"
cp "$SCRIPT_DIR/.claude/agents/lead-qualifier.md" "$AGENTS_DEST/lead-qualifier.md"
cp "$SCRIPT_DIR/.claude/skills/captar-leads/SKILL.md" "$SKILLS_DEST/SKILL.md"

echo ""
echo "Instalado com sucesso."
echo "Abra uma sessão NOVA do Claude Code (comando: claude) e digite: /captar-leads"
