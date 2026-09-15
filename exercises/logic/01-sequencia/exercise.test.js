import test from 'node:test';
import assert from 'node:assert/strict';
import { calcularTotal } from './exercise.js';

test('calcula desconto antes do frete', () => assert.equal(calcularTotal(100, 15, 12), 97));
test('aceita limites válidos', () => {
  assert.equal(calcularTotal(50, 0, 0), 50);
  assert.equal(calcularTotal(50, 100, 10), 10);
});
test('rejeita entrada inválida', () => {
  assert.throws(() => calcularTotal(-1, 10, 0));
  assert.throws(() => calcularTotal(10, 101, 0));
  assert.throws(() => calcularTotal('10', 5, 0));
});

