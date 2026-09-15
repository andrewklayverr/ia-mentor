import test from 'node:test';
import assert from 'node:assert/strict';
import { analisarNotas } from './exercise.js';

test('calcula sem mutar', () => {
  const notas = [6, 8, 10, 7];
  const copia = [...notas];
  assert.deepEqual(analisarNotas(notas), { media: 7.75, maior: 10, menor: 6, aprovadas: 3 });
  assert.deepEqual(notas, copia);
});
test('rejeita coleção inválida', () => {
  assert.throws(() => analisarNotas([]));
  assert.throws(() => analisarNotas([11]));
});

