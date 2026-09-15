# Trilha 0 — Lógica de programação e algoritmos

Esta é a prioridade atual. O objetivo é aprender um processo repetível para transformar problemas em passos, não decorar desafios.

## Método ENTENDA

1. **E**xplique o problema com suas palavras.
2. **N**omeie entradas, saídas e restrições.
3. **T**este exemplos manualmente, incluindo limites.
4. **E**screva passos em linguagem natural ou pseudocódigo.
5. **N**ote invariantes e casos especiais.
6. **D**esenvolva a menor solução correta.
7. **A**valie com testes e complexidade básica.

O mentor pede esses passos antes do código em problemas novos.

## L0 — Diagnóstico sem julgamento

Rastrear código curto, decompor problema cotidiano, resolver uma condição, construir loop, explicar função e manipular array. A saída é um mapa de evidências; experiência declarada não pula automaticamente a trilha.

## L1 — Sequência, estado e rastreamento

**Conceitos:** algoritmo, instrução, ordem, entrada, saída, variável, atribuição, estado e tabela de rastreamento.

**Treino:** simular valores linha a linha; identificar estado inicial/final; converter receita em algoritmo; `exercises/logic/01-sequencia`.

**Gate:** acertar 4 de 5 rastreamentos e explicar atribuição sem chamar `=` de igualdade matemática.

## L2 — Expressões, booleanos e decisões

**Conceitos:** operadores, precedência, comparação, booleanos, tabela-verdade, `if/else`, condições compostas e casos exclusivos.

**Treino:** tabela-verdade, condição redundante, partição de entradas e `02-condicionais`.

**Gate:** implementar três decisões com fronteiras e explicar por que cada ramo é alcançado.

## L3 — Repetição e invariantes

**Conceitos:** contador, acumulador, sentinela, `for`, `while`, parada, off-by-one e invariantes simples.

**Treino:** somar faixas, contar ocorrências, gerar padrões, rastrear iterações e `03-loops`.

**Gate:** escrever loop sem tentativa aleatória, prever iterações e justificar término.

## L4 — Funções e decomposição

**Conceitos:** responsabilidade, parâmetros, retorno, escopo, função pura, contrato e composição.

**Treino:** quebrar problema em funções, distinguir imprimir de retornar e `04-funcoes`.

**Gate:** decompor problema em três funções coerentes e testar contratos isoladamente.

## L5 — Arrays, strings e travessias

**Conceitos:** índice, tamanho, travessia, transformação, filtro, busca, redução, mutação e cópia.

**Treino:** implementar manualmente antes de `map/filter/reduce` e `05-arrays`.

**Gate:** escolher entre buscar, contar, filtrar, transformar e acumular em tarefas misturadas.

## L6 — Padrões de solução

**Conceitos:** frequência, dois ponteiros introdutório, máximo/mínimo, janela simples, conjunto/mapa e subproblemas.

**Treino:** anagramas, duplicatas, par-alvo, agrupamento e `06-algoritmos`.

**Gate:** aplicar três padrões sem receber o nome do padrão.

## L7 — Busca, ordenação e complexidade

**Conceitos:** busca linear/binária, seleção/inserção para compreensão, `O(1)`, `O(n)`, `O(n²)` e espaço.

**Gate:** comparar duas soluções corretas e justificar qual escala melhor.

## L8 — Recursão sem magia

**Conceitos:** caso-base, progresso, pilha e equivalência com repetição.

**Gate:** identificar caso-base e mostrar que cada chamada se aproxima dele.

## L9 — Estratégia e debugging

**Conceitos:** hipótese, reprodução mínima, observação, teste, correção e prevenção.

**Gate:** localizar erro por evidência, sem reescrever tudo nem pedir solução completa.

## Prova de saída

Três problemas inéditos: decisão com fronteiras, travessia de coleção e problema com decomposição/padrão simples. Exigir 80%, nenhuma pista acima do nível 2, explicação da complexidade e autocorreção de testes.

## Rotina

- três sessões semanais de implementação curta;
- uma sessão de debugging;
- uma revisão misturada de 15 minutos;
- no máximo um conceito novo por sessão;
- recuperar conteúdo antigo antes do novo.

