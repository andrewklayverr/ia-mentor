# Segurança e privacidade

## Dados locais

Este repositório publica apenas a estrutura do mentor. Perfil, progresso, respostas, histórico de sessões, erros, configuração de foco e credenciais permanecem locais e estão listados no `.gitignore`.

Nunca remova essas regras para publicar dados reais. Use somente os arquivos `*.example.*` como modelos públicos.

## Segredos

Não salve tokens, senhas, chaves de API, arquivos `.env`, credenciais do Codex ou chaves privadas dentro do projeto. A autenticação do Codex deve permanecer no diretório próprio da ferramenta ou no volume Docker `codex-home`.

Antes de cada publicação, execute:

```bash
npm run check:public
git status --short
git diff --cached
```

O verificador reduz riscos, mas não substitui a revisão humana. Se um segredo for publicado, revogue-o imediatamente; apenas apagar o arquivo do commit seguinte não o remove do histórico.

## Relato de vulnerabilidades

Não publique credenciais ou dados pessoais em issues. Abra uma issue sem informações sensíveis para solicitar um canal privado ao mantenedor.
