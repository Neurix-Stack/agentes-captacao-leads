# Agentes de Captação de Leads — de presente

Um comando (`/captar-leads`) que automatiza a primeira parte de qualquer processo comercial: acha empresas/contatos que batem com seu perfil de cliente ideal e já entrega uma lista qualificada, com score, pronta pra importar no CRM. Você não escreve nenhum prompt — só responde umas perguntas simples.

## O que você precisa ter
- [Claude Code](https://claude.com/claude-code) instalado (gratuito pra começar).

## Como instalar

**Opção 1 — instalador automático (recomendado):**
- Windows: clique com o botão direito em `instalar.ps1` → "Executar com PowerShell" (ou rode `powershell -ExecutionPolicy Bypass -File instalar.ps1` no terminal).
- Mac/Linux: abra o terminal nesta pasta e rode `bash instalar.sh`.

**Opção 2 — manual:** copie `.claude/agents/lead-finder.md`, `.claude/agents/lead-qualifier.md` e a pasta `.claude/skills/captar-leads/` pra dentro do seu `~/.claude/` (no Windows: `C:\Users\SEU-USUARIO\.claude\`), nas subpastas `agents/` e `skills/` correspondentes.

## Como usar

1. Abra um terminal e digite `claude` (precisa ser depois de instalar).
2. Digite `/captar-leads`.
3. Responda as perguntas que aparecerem (o que você vende, tipo de empresa, região, porte, cargo de quem decide, e o que faz um lead ser bom pra você).
4. Pronto — em alguns minutos você recebe uma planilha `.xlsx` com os leads encontrados, já com score (quente/morno/frio) e pronta pra importar no seu CRM.

Só isso. Sem prompt pra copiar, sem saber o nome dos agentes por trás.

## Importante saber antes de usar
- Sem uma ferramenta de prospecção paga conectada, a busca roda por **pesquisa web** — ela acerta empresa/site/segmento com boa confiança, mas **nome e cargo do decisor certo** é o ponto mais frágil dessa abordagem. Revise essa coluna antes de abordar.
- Isso é um ponto de partida validável na mão. Automação de ponta a ponta — com fonte de dado melhor que busca web, e já integrada ao seu CRM sem precisar de exportação manual — é o tipo de coisa que a Neurix constrói sob medida.

## Quer ir além disso?
Se você quer que isso rode sozinho, integrado ao seu CRM, com fonte de dados melhor que busca web — me chama: [@lucasessado](https://instagram.com/lucasessado).
