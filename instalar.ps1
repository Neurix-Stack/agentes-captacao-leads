# Instala a skill "captar-leads" e os subagents que ela usa no Claude Code.
# Rode com: powershell -ExecutionPolicy Bypass -File instalar.ps1

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$agentsDest = Join-Path $env:USERPROFILE ".claude\agents"
$skillsDest = Join-Path $env:USERPROFILE ".claude\skills\captar-leads"

New-Item -ItemType Directory -Force -Path $agentsDest | Out-Null
New-Item -ItemType Directory -Force -Path $skillsDest | Out-Null
Copy-Item (Join-Path $scriptDir ".claude\agents\lead-finder.md") -Destination $agentsDest -Force
Copy-Item (Join-Path $scriptDir ".claude\agents\lead-qualifier.md") -Destination $agentsDest -Force
Copy-Item (Join-Path $scriptDir ".claude\skills\captar-leads\SKILL.md") -Destination $skillsDest -Force

Write-Output ""
Write-Output "Instalado com sucesso."
Write-Output "Abra uma sessao NOVA do Claude Code (comando: claude) e digite: /captar-leads"
