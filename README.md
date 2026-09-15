# IA Mentor

Um template aberto de ambiente local de estudo guiado pelo Codex CLI. Ele combina instruções persistentes, currículo, memória local do aluno, exercícios iniciais e um modo de foco reversível para Windows.

O repositório não inclui nome, respostas, progresso, histórico, senhas ou credenciais de nenhuma pessoa. Cada instalação cria seus próprios arquivos privados a partir dos modelos `*.example.*`.

Pode ser executado diretamente no Windows ou em Docker. No modo Docker, o núcleo do mentor fica isolado e o foco continua no Windows anfitrião.

## O que já funciona

- mentor em português com escada anti-resposta-pronta;
- sessões curtas, adaptativas e orientadas a uma missão;
- progresso e revisões espaçadas em arquivos locais;
- exercícios iniciais de JavaScript e backend;
- trilha completa de lógica, algoritmos e JavaScript do zero;
- banco com 30 problemas e seis exercícios autocorrigidos;
- política de fontes oficiais e aulas auditáveis;
- Node.js 24 LTS como runtime de referência;
- rubrica objetiva de domínio;
- modos Professor, Tutor, Pair, Review e Desafio;
- bloqueio temporário de aplicativos e sites autorizados;
- comando de emergência para desligar o foco.

## Requisitos

- Windows 10/11 e PowerShell 5.1 ou 7;
- Node.js (para executar os exercícios);
- Codex CLI instalado e autenticado.

Como alternativa, use apenas Docker Desktop para o núcleo do mentor; veja `docs/DOCKER.md`.

O bloqueio de sites edita somente uma seção marcada no arquivo `hosts` e requer abrir o PowerShell como Administrador. Sem ele, o bloqueio de aplicativos ainda funciona.

## Instalação rápida

1. Clone ou baixe o repositório para um local permanente.
2. Abra PowerShell nessa pasta.
3. Rode:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\setup.ps1
```

4. Feche e abra o terminal novamente.
5. Rode:

```powershell
mentor doctor
mentor start
```

Se não quiser instalar o comando global, use:

```powershell
.\mentor.ps1
```

O mentor só é aberto por `mentor start`. Ele começa automaticamente pelo ponto salvo, com uma questão de recuperação. Na primeira execução, inicia o diagnóstico de lógica.

A prioridade inicial será lógica. Confira o ambiente com `npm run verify`. Para testar o primeiro exercício, use `npm run check:logic:1`; o teste falhará enquanto ele não estiver implementado, e isso é esperado.

## Privacidade por padrão

Na primeira execução, o instalador copia os arquivos públicos de exemplo para arquivos locais ignorados pelo Git. Permanecem somente no computador do aluno:

- perfil e preferências;
- diagnóstico, erros e evidências de aprendizagem;
- progresso e fila de revisões;
- sessão atual e histórico;
- configuração e estado do modo de foco;
- projetos pessoais;
- autenticação e credenciais do Codex.

Antes de publicar mudanças, execute:

```powershell
npm run verify
git status --short
git diff --cached
```

Consulte `SECURITY.md` antes de alterar o `.gitignore`.

### Opção Docker

```powershell
.\mentor-docker.ps1 build
.\mentor-docker.ps1 start
```

O primeiro uso solicitará autenticação. A memória do curso continua persistida nesta pasta.

## Comandos

```powershell
mentor start           # única entrada: retoma ou inicia o diagnóstico
mentor                 # apenas mostra como iniciar; não abre o mentor
mentor progress        # mostra o progresso local
mentor focus on 20     # ativa foco por 20 minutos
mentor focus status    # mostra o estado
mentor focus off       # encerra imediatamente
mentor doctor          # verifica requisitos e arquivos
```

## Personalização essencial

Edite antes de usar:

- `student/profile.md`: objetivos, rotina e experiência — arquivo local;
- `focus/config.json`: aplicativos e sites autorizados — arquivo local;
- `curriculum/fullstack.md`: ordem desejada da trilha.

Use nomes de processo sem `.exe`, como `Discord` e `steam`. Navegadores inteiros não vêm bloqueados por padrão; a V0 bloqueia sites pelo `hosts` quando há privilégio de Administrador.

## Segurança e limites

- O foco nunca impede `mentor focus off`.
- O guardião para sozinho no fim do tempo.
- O arquivo `hosts` é alterado apenas entre marcadores próprios.
- Aplicativos são encerrados, não desinstalados.
- O agente pede confirmação antes de iniciar foco ou realizar mudanças relevantes.
- Isto é uma ferramenta educacional, não tratamento médico.

## Como estudar

1. Execute `mentor start`.
2. Responda à única questão curta de recuperação apresentada.
3. Continue do ponto salvo em uma micro-missão.
4. Digite `encerrar sessão` ao terminar.
5. O mentor registra a evidência, o ponto exato e a revisão futura.

## Documentação

- `docs/METODOLOGIA.md`: decisões pedagógicas e limites.
- `docs/ROADMAP.md`: caminho sugerido de V0 para V1.
- `docs/DOCKER.md`: execução isolada e divisão entre contêiner e Windows.
- `focus/README.md`: detalhes do bloqueador.
- `sources/POLICY.md`: verificação técnica.
- `curriculum/00-logica-algoritmos.md`: trilha prioritária.
- `curriculum/01-javascript-do-zero.md`: JavaScript fundamental.
- `curriculum/MASTERY.md`: critérios de avanço.

O Codex carrega `AGENTS.md` quando inicia a sessão. Se você editar as instruções, reinicie o Codex.

## Licença

MIT. Você pode copiar e adaptar o projeto mantendo o aviso de licença.
