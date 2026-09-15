import test from 'node:test';
import assert from 'node:assert/strict';
import { encontrarPar } from './exercise.js';

test('encontra índices', () => {
  assert.deepEqual(encontrarPar([2, 7, 11, 15], 9), [0, 1]);
  assert.deepEqual(encontrarPar([3, 3], 6), [0, 1]);
});
test('não reutiliza índice e aceita ausência', () => {
  assert.equal(encontrarPar([3], 6), null);
  assert.equal(encontrarPar([1, 2, 3], 99), null);
});

