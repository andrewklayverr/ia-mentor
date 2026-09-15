# Executar o mentor em Docker

## Arquitetura híbrida

O contêiner executa Codex, Node.js, Git, exercícios e memória. Os scripts de foco executam diretamente no Windows, porque um contêiner comum não controla com segurança os aplicativos nem o arquivo `hosts` do anfitrião.

```text
Windows: mentor focus on/off + arquivos do projeto
                     |
Docker: Codex CLI + ensino + código + memória
```

## Requisitos

- Docker Desktop em execução;
- PowerShell;
- conexão disponível para autenticação e uso do Codex.

Não é necessário instalar Node.js nem Codex CLI diretamente no Windows para o caminho Docker.

## Primeiro uso

Na pasta do projeto:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\mentor-docker.ps1 build
.\mentor-docker.ps1 start
```

No primeiro uso, siga o fluxo de autenticação exibido pelo Codex. A autenticação fica no volume Docker `codex-home`; os dados de estudo permanecem na pasta local montada em `/workspace`.

## Uso diário

```powershell
.\mentor-docker.ps1 start
```

Para foco, use o processo do Windows em outro terminal:

```powershell
.\mentor.ps1 focus on 20
.\mentor.ps1 focus status
.\mentor.ps1 focus off
```

## Atualizar o Codex da imagem

```powershell
.\mentor-docker.ps1 update
```

## Limites importantes

- A pasta do projeto é montada com permissão de escrita para que o progresso seja persistido.
- Não monte o disco inteiro nem o diretório pessoal no contêiner.
- O contêiner não recebe acesso ao Docker socket.
- O modo foco permanece fora do contêiner deliberadamente.
