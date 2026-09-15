[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [string]$Command = ''
)

$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
& (Join-Path $root 'scripts\init-local.ps1')

if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    throw 'Docker não encontrado. Instale/inicie o Docker Desktop e tente novamente.'
}

Push-Location $root
try {
    switch ($Command.ToLowerInvariant()) {
        ''       { Write-Host 'Para abrir o mentor em Docker, use: .\mentor-docker.ps1 start' -ForegroundColor Yellow }
        'start'  { docker compose run --rm mentor 'Inicialize o mentor agora pelo protocolo Entrada única e início automático do AGENTS.md. Retome o estado persistido. Mostre somente uma questão curta de recuperação; se não houver histórico, comece a tarefa D1 de curriculum/DIAGNOSTIC.md.' }
        'build'  { docker compose build }
        'update' { docker compose build --pull --no-cache }
        default  { Write-Host 'Use: .\mentor-docker.ps1 [build|start|update]' }
    }
} finally {
    Pop-Location
}
