import fs from 'node:fs';
import path from 'node:path';

const root = path.resolve(import.meta.dirname, '..');
const files = [
  ['student/profile.example.md', 'student/profile.md'],
  ['student/progress.example.json', 'student/progress.json'],
  ['student/review-queue.example.json', 'student/review-queue.json'],
  ['student/mistakes.example.md', 'student/mistakes.md'],
  ['student/diagnostic.example.md', 'student/diagnostic.md'],
  ['sessions/current.example.json', 'sessions/current.json'],
  ['focus/config.example.json', 'focus/config.json'],
  ['focus/state.example.json', 'focus/state.json']
];

for (const [source, target] of files) {
  const targetPath = path.join(root, target);
  if (!fs.existsSync(targetPath)) {
    fs.copyFileSync(path.join(root, source), targetPath);
    console.log(`[CRIADO] ${target}`);
  }
}
