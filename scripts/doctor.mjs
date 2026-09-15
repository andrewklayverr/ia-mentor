import fs from 'node:fs';
import path from 'node:path';
import process from 'node:process';

const root = path.resolve(import.meta.dirname, '..');
const required = ['AGENTS.md', 'sources/POLICY.md', 'sources/registry.json', 'curriculum/MASTERY.md', 'curriculum/DIAGNOSTIC.md', 'curriculum/00-logica-algoritmos.md', 'curriculum/01-javascript-do-zero.md', 'student/progress.json', 'student/review-queue.json', 'sessions/current.json'];
let failed = false;
const major = Number(process.versions.node.split('.')[0]);
console.log(`${major === 24 ? '[OK]' : '[AVISO]'} Node.js ${process.versions.node} (referência: 24.x LTS)`);

for (const relative of required) {
  const ok = fs.existsSync(path.join(root, relative));
  console.log(`${ok ? '[OK]' : '[FALTA]'} ${relative}`);
  failed ||= !ok;
}

for (const relative of ['sources/registry.json', 'student/progress.json', 'student/review-queue.json', 'sessions/current.json']) {
  try {
    JSON.parse(fs.readFileSync(path.join(root, relative), 'utf8'));
    console.log(`[OK] JSON válido: ${relative}`);
  } catch (error) {
    console.error(`[ERRO] JSON inválido: ${relative} — ${error.message}`);
    failed = true;
  }
}
if (failed) process.exitCode = 1;
