import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';

const readJson = (path) => JSON.parse(fs.readFileSync(new URL(path, import.meta.url), 'utf8'));

test('fontes usam HTTPS e IDs únicos', () => {
  const registry = readJson('../sources/registry.json');
  const ids = registry.sources.map((source) => source.id);
  assert.equal(new Set(ids).size, ids.length);
  for (const source of registry.sources) {
    assert.match(source.url, /^https:\/\//);
    assert.ok(source.title && source.authority);
  }
});

test('progresso usa estados reconhecidos', () => {
  const progress = readJson('../student/progress.json');
  const allowed = new Set(['nao_iniciado', 'visto', 'entende', 'aplica_com_ajuda', 'aplica_sozinho', 'explica', 'domina']);
  for (const area of Object.values(progress.areas)) {
    for (const topic of Object.values(area.topics)) {
      assert.ok(allowed.has(topic.status), `Estado inválido: ${topic.status}`);
      assert.ok(topic.confidence >= 0 && topic.confidence <= 1);
      assert.ok(Array.isArray(topic.evidence));
    }
  }
});

test('sessão inicial está inativa', () => {
  assert.equal(readJson('../sessions/current.json').active, false);
});

test('diagnóstico contém seis tarefas e entrada é única', () => {
  const diagnostic = fs.readFileSync(new URL('../curriculum/DIAGNOSTIC.md', import.meta.url), 'utf8');
  const agents = fs.readFileSync(new URL('../AGENTS.md', import.meta.url), 'utf8');
  assert.equal((diagnostic.match(/^## D[1-6] /gm) || []).length, 6);
  assert.match(agents, /único comando que abre o mentor é `mentor start`/);
});
