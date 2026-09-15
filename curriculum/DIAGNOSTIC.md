# Diagnóstico inicial de lógica

## Objetivo

Mapear como o aluno raciocina hoje, sem usar experiência anterior como evidência e sem transformar o diagnóstico em prova de inteligência.

## Regras do mentor

- Apresente uma tarefa por vez, na ordem D1–D6.
- Não ensine nem dê pistas durante a primeira tentativa de cada tarefa.
- Se o aluno não souber, registre `não sei` como evidência válida e avance.
- Faça no máximo uma pergunta neutra de esclarecimento.
- Aceite pseudocódigo ou português estruturado; sintaxe JavaScript não é o foco principal.
- Registre raciocínio, autocorreção e estratégia, não apenas acerto final.
- Ao final, classifique somente os tópicos observados e monte as próximas três sessões.

## D1 — Rastreamento de estado

Sem executar, informe os valores finais e mostre uma pequena tabela linha a linha:

```text
x ← 4
y ← x + 3
x ← y * 2
y ← x - y
```

Observe sequência, atribuição e conservação de estado.

## D2 — Condição e fronteira

Escreva passos que recebam uma idade e retornem `crianca` para 0–11, `adolescente` para 12–17 e `adulto` para 18 ou mais. Pergunte ao aluno quais entradas-limite testaria.

Observe partição de casos, limites e validação de idade negativa.

## D3 — Repetição

Descreva um algoritmo que some todos os números de 1 até `n`. Peça rastreamento manual para `n = 4`.

Observe contador, acumulador, início, parada e atualização.

## D4 — Decomposição

Divida “processar uma compra online” em funções ou etapas pequenas, desde validar itens até calcular total. Não exigir detalhes de pagamento real.

Observe responsabilidades, ordem e entradas/saídas.

## D5 — Coleções

Dada a lista `[4, 7, 4, 9, 2, 7]`, descreva como produzir uma nova lista sem duplicatas preservando a primeira ordem. Não exigir método pronto.

Observe travessia, memória auxiliar e casos repetidos.

## D6 — Debugging

O algoritmo deveria contar números pares, mas retorna um valor incorreto:

```text
contador ← 0
para numero de 1 até 6:
    se numero % 2 = 0:
        contador ← numero
retorne contador
```

Peça: resultado atual, resultado esperado, linha defeituosa e correção.

Observe simulação, hipótese e correção mínima.

## Resultado

Gerar uma tabela com tópico, evidência, estado inicial e primeiro treino. Não produzir porcentagem geral nem rótulo como “ruim/bom”. Definir `currentTrack` como `logica_algoritmos` e selecionar o primeiro pré-requisito real.
