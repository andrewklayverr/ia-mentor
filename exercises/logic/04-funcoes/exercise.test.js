import test from 'node:test';
import assert from 'node:assert/strict';
import { validarItens, calcularSubtotal, resumirCompra } from './exercise.js';
const itens = [{ nome: 'Teclado', preco: 100, quantidade: 1 }, { nome: 'Cabo', preco: 20, quantidade: 2 }];
test('valida e calcula partes', () => {
  assert.equal(validarItens(itens), true);
  assert.equal(calcularSubtotal(itens), 140);
});
test('resume compra', () => assert.deepEqual(resumirCompra(itens, 10), { subtotal: 140, frete: 10, total: 150, unidades: 3 }));
test('rejeita inválido', () => assert.throws(() => validarItens([{ nome: '', preco: -1, quantidade: 0 }])));

