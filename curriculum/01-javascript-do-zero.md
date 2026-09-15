# Trilha 1 — JavaScript do zero

**Runtime:** Node.js 24 LTS.
**Fontes:** `mdn-js-guide`, `ecma-2026` e `node-learn` em `sources/registry.json`.

Cada unidade segue: previsão → exemplo mínimo → tentativa → teste → explicação → variação → revisão futura.

## J0 — Ambiente e primeiro programa

Arquivo `.js`, terminal, `node arquivo.js`, diferença entre editar/executar/observar, `console.log` versus retorno e leitura de erros.

**Entrega:** programa que calcula e exibe um resumo.

## J1 — Valores, tipos e variáveis

Tipos primitivos, `const`, `let`, atribuição, `typeof`, conversão explícita, `NaN`, precisão numérica e template strings.

**Gate:** prever tipos/valores e corrigir conversões problemáticas.

## J2 — Expressões e operadores

Aritméticos, comparação estrita, lógicos, curto-circuito, precedência e truthy/falsy demonstrados por código.

**Gate:** escrever e explicar condições sem comparações matemáticas inválidas.

## J3 — Controle de fluxo

`if/else`, `switch` quando apropriado, retorno antecipado, partição de casos e fronteiras.

**Entrega:** classificador com testes de limite.

## J4 — Repetição

`for`, `while`, `for...of`, contador, acumulador, `break`, `continue`, índices e término.

**Entrega:** relatório calculado de uma coleção, primeiro sem métodos de array.

## J5 — Funções e escopo

Declaração, expressão, arrow function, parâmetros, retorno, escopo léxico, função pura, efeitos e closures.

**Entrega:** biblioteca pequena de funções testáveis.

## J6 — Arrays e strings

Acesso, cópia, mutação, travessia, `map`, `filter`, `find`, `some`, `every`, `reduce` e strings imutáveis. Implementar equivalentes manualmente primeiro.

**Entrega:** analisador de dados simples.

## J7 — Objetos, Map e Set

Propriedades, destructuring, spread raso, referência versus valor e escolha entre objeto, `Map` e `Set`.

**Entrega:** agrupador e contador de frequências.

## J8 — Erros, módulos e arquivos

`throw`, `try/catch/finally`, erros esperados versus bugs, módulos ES, JSON, arquivos no Node.js e validação de fronteiras.

**Entrega:** CLI local persistida em JSON.

## J9 — Assincronicidade

Síncrono/assíncrono, callbacks, Promise, `async/await`, rejeição, concorrência versus paralelismo e event loop do Node.js sem generalização indevida para navegadores.

**Entrega:** processador assíncrono com falhas simuladas.

## J10 — Testes e debugging

Arrange–Act–Assert, casos normais/limites/erro, Node test runner, `node:assert/strict`, reprodução mínima e stack traces.

**Entrega:** testes comportamentais das funções anteriores.

## Projeto de conclusão

CLI de tarefas de estudo com criação, listagem, conclusão, filtro, JSON, validação, módulos, testes e README. Na avaliação, implementar uma funcionalidade nova sem solução da IA.

## Saída

Todos os gates J1–J10 em `aplica_sozinho` ou superior, projeto passando, explicação do fluxo de dados/mutação/erros/assincronicidade e recuperação após sete dias.

