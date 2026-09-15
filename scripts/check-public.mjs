import fs from 'node:fs';
import path from 'node:path';

const root = path.resolve(import.meta.dirname, '..');
const excluded = new Set(['.git', 'node_modules', 'coverage', 'dist', 'build']);
const privatePaths = new Set([
  'student/profile.md',
  'student/progress.json',
  'student/review-queue.json',
  'student/mistakes.md',
  'student/diagnostic.md',
  'sessions/current.json',
  'focus/config.json',
  'focus/state.json'
]);
const secretPatterns = [
  ['e-mail', /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/i],
  ['chave OpenAI', /\bsk-[A-Za-z0-9_-]{16,}\b/],
  ['token GitHub', /\b(?:ghp|gho|ghu|ghs|ghr)_[A-Za-z0-9]{20,}\b/],
  ['token GitHub', /\bgithub_pat_[A-Za-z0-9_]{20,}\b/],
  ['chave privada', /-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----/]
];

function walk(directory) {
  return fs.readdirSync(directory, { withFileTypes: true }).flatMap((entry) => {
    if (excluded.has(entry.name)) return [];
    const absolute = path.join(directory, entry.name);
    return entry.isDirectory() ? walk(absolute) : [absolute];
  });
}

let failed = false;
for (const absolute of walk(root)) {
  const relative = path.relative(root, absolute).replaceAll('\\', '/');
  if (privatePaths.has(relative)) continue;
  const bytes = fs.readFileSync(absolute);
  if (bytes.includes(0)) continue;
  const content = bytes.toString('utf8');
  for (const [label, pattern] of secretPatterns) {
    if (pattern.test(content)) {
      console.error(`[BLOQUEADO] Possível ${label}: ${relative}`);
      failed = true;
    }
  }
}

if (failed) process.exitCode = 1;
else console.log('[OK] Nenhum segredo de alta confiança encontrado nos arquivos públicos.');
