---
name: captar-leads
description: Conduz uma entrevista guiada (pergunta por pergunta, sem exigir prompt técnico) pra coletar o ICP e o critério de qualificação do usuário, e orquestra os subagents lead-finder e lead-qualifier até entregar uma planilha de leads qualificados pronta pro CRM. Use quando o usuário disser que quer captar leads, prospectar, gerar demanda, ou "achar clientes novos".
---

# Captar Leads

Objetivo: o usuário nunca escreve um prompt técnico. Ele só responde perguntas simples, uma de cada vez, e recebe uma planilha pronta no final. Você é quem monta o briefing e aciona os agentes por trás dos panos.

## Passo 0 — Checar pré-requisito
Confirme (via leitura de arquivo, silenciosamente, sem perguntar ao usuário) que os subagents `lead-finder` e `lead-qualifier` existem — normalmente em `~/.claude/agents/` ou `.claude/agents/` do projeto. Se algum estiver faltando, avise o usuário em uma frase (ex.: "Preciso que você instale o pacote de agentes primeiro — o instalador está no `LEIA-ME.md`.") e pare aqui.

## Passo 1 — Entrevista de ICP
Faça as perguntas abaixo **uma de cada vez**, esperando a resposta antes de seguir pra próxima. Linguagem simples, sem jargão:

1. "Qual produto ou serviço você quer vender com esses leads?"
2. "Que tipo de empresa é o cliente ideal? (segmento/ramo)"
3. "Em qual região? (cidade, estado, país — ou 'qualquer lugar' se não importa)"
4. "Qual o porte dessas empresas? (pequena, média, grande — ou número de funcionários, se souber)"
5. "Qual cargo costuma decidir essa compra? (ex: dono, gerente comercial, diretor de RH)"

Se o usuário já respondeu tudo isso de uma vez na primeira mensagem, não repita as perguntas — confirme o que você entendeu em uma frase e siga.

## Passo 2 — Critério de qualificação
Pergunte, em linguagem simples: "O que faz um lead ser realmente bom pra essa oferta? Me dá um ou dois sinais concretos (ex: já ter equipe de vendas, faturar acima de X, ter aberto vaga pra Y, ter levantado investimento recentemente)."

## Passo 3 — Buscar (delegar pro lead-finder)
Monte o briefing internamente juntando as respostas dos passos 1-2 no formato que o `lead-finder` espera (oferta/empresa, segmento, região, porte, cargo do decisor) e delegue a tarefa a esse subagent. Não mostre esse briefing bruto pro usuário — apenas diga algo como "Buscando empresas que batem com esse perfil..." enquanto roda.

## Passo 4 — Qualificar (delegar pro lead-qualifier)
Assim que o `lead-finder` terminar e salvar a lista bruta, delegue ao `lead-qualifier`, passando o critério de qualificação do Passo 2. Diga "Agora avaliando o fit de cada um..." enquanto roda.

## Passo 5 — Entregar
Sem pedir mais nada ao usuário: pegue o CSV qualificado, deduplique por empresa, ordene por score decrescente (quente > morno > frio) e gere uma planilha `.xlsx` pronta pra importar em CRM, salva na pasta atual como `leads-{data de hoje, AAAA-MM-DD}.xlsx`.

Feche com um resumo curto e direto: quantos leads no total, quantos quentes/mornos/frios, e o nome do arquivo gerado. Não explique o processo técnico (subagents, CSV, arquivos temporários) — pra quem está do outro lado, a experiência é "respondi 6 perguntas e recebi uma planilha".

## Se algo falhar
Se a busca não encontrar nada, ou vier muito genérica, diga isso com clareza e pergunte se quer ajustar algum critério (região mais ampla, segmento diferente) e tentar de novo — nunca trave em silêncio nem invente resultado.
