import test from 'node:test';
import assert from 'node:assert/strict';
import { classificarAcesso } from './exercise.js';

test('prioriza autenticação e estado', () => {
  assert.equal(classificarAcesso({ autenticado: false, ativo: true, papel: 'admin' }), 'nao_autenticado');
  assert.equal(classificarAcesso({ autenticado: true, ativo: false, papel: 'admin' }), 'conta_inativa');
});
test('classifica papéis', () => {
  assert.equal(classificarAcesso({ autenticado: true, ativo: true, papel: 'admin' }), 'administrador');
  assert.equal(classificarAcesso({ autenticado: true, ativo: true, papel: 'user' }), 'usuario');
  assert.equal(classificarAcesso({ autenticado: true, ativo: true, papel: 'guest' }), 'papel_invalido');
});

