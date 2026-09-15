# Modo foco no Windows

O modo foco tem duas camadas:

1. encerra novamente os processos listados em `config.json` enquanto a sessão estiver ativa;
2. quando executado como Administrador, acrescenta domínios ao arquivo `hosts` dentro de marcadores próprios.

## Configurar

Edite `config.json`. Use apenas nomes de processo simples, sem `.exe`, e domínios sem `https://` ou caminhos.

## Usar

```powershell
mentor focus on 20
mentor focus status
mentor focus off
```

Para bloquear sites, abra PowerShell como Administrador antes de iniciar. Caso contrário, apenas os aplicativos serão monitorados.

## Recuperação manual

Se o computador reiniciar durante uma sessão, rode como Administrador:

```powershell
.\focus\stop.ps1
```

O script remove somente o bloco entre `BEGIN FULLSTACK-MENTOR-FOCUS` e `END FULLSTACK-MENTOR-FOCUS`.

## Limitações

- Aplicativos da Microsoft Store podem usar nomes de processo diferentes.
- Alguns navegadores ou DNS seguro podem ignorar o arquivo `hosts` em certas configurações.
- A V0 não bloqueia abas específicas nem desativa permanentemente programas.
- O bloqueio é deliberadamente reversível e não tenta impedir o proprietário de recuperar controle.

