import test from 'node:test';
import assert from 'node:assert/strict';
import { estatisticas } from './exercise.js';

test('calcula intervalo inclusivo', () => {
  assert.deepEqual(estatisticas(2, 5), { soma: 14, quantidade: 4, pares: 2 });
  assert.deepEqual(estatisticas(0, 0), { soma: 0, quantidade: 1, pares: 1 });
});
test('rejeita intervalo inválido', () => {
  assert.throws(() => estatisticas(5, 2));
  assert.throws(() => estatisticas(1.5, 3));
});

