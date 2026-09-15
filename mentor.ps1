[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [string]$Command = '',
    [Parameter(Position = 1)]
    [string]$Action = '',
    [Parameter(Position = 2)]
    [int]$Minutes = 20
)

$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
& (Join-Path $root 'scripts\init-local.ps1')

function Show-Banner {
    Write-Host ''
    Write-Host 'FULLSTACK MENTOR V0.1' -ForegroundColor Cyan
    Write-Host 'Aprenda construindo. A IA orienta; você raciocina.'
    Write-Host ''
}

function Invoke-Codex([string]$Prompt = '') {
    if (-not (Get-Command codex -ErrorAction SilentlyContinue)) {
        throw 'Codex CLI não encontrado. Execute mentor doctor para diagnóstico.'
    }
    Push-Location $root
    try {
        if ($Prompt) { & codex $Prompt } else { & codex }
    } finally {
        Pop-Location
    }
}

function Show-Progress {
    $path = Join-Path $root 'student\progress.json'
    $data = Get-Content $path -Raw | ConvertFrom-Json
    Show-Banner
    Write-Host ("Sessões concluídas: {0}" -f $data.meta.sessionsCompleted)
    foreach ($area in $data.areas.PSObject.Properties) {
        $topics = @($area.Value.topics.PSObject.Properties)
        $started = @($topics | Where-Object { $_.Value.status -ne 'nao_iniciado' }).Count
        Write-Host ("{0,-18} {1}/{2} tópicos iniciados" -f $area.Name, $started, $topics.Count)
    }
}

function Invoke-Doctor {
    Show-Banner
    $checks = @(
        @{ Name = 'Codex CLI'; Ok = [bool](Get-Command codex -ErrorAction SilentlyContinue) },
        @{ Name = 'Node.js'; Ok = [bool](Get-Command node -ErrorAction SilentlyContinue) },
        @{ Name = 'AGENTS.md'; Ok = Test-Path (Join-Path $root 'AGENTS.md') },
        @{ Name = 'Progresso'; Ok = Test-Path (Join-Path $root 'student\progress.json') },
        @{ Name = 'Configuração de foco'; Ok = Test-Path (Join-Path $root 'focus\config.json') }
    )
    foreach ($check in $checks) {
        $mark = if ($check.Ok) { '[OK]' } else { '[FALTA]' }
        $color = if ($check.Ok) { 'Green' } else { 'Yellow' }
        Write-Host ("{0,-8} {1}" -f $mark, $check.Name) -ForegroundColor $color
    }
}

switch ($Command.ToLowerInvariant()) {
    '' {
        Show-Banner
        Write-Host 'Para abrir o mentor, use: mentor start' -ForegroundColor Yellow
    }
    'start' {
        Invoke-Codex 'Inicialize o mentor agora pelo protocolo Entrada única e início automático do AGENTS.md. Retome o estado persistido. Mostre somente uma questão curta de recuperação; se não houver histórico, comece a tarefa D1 de curriculum/DIAGNOSTIC.md.'
    }
    'progress' { Show-Progress }
    'doctor'   { Invoke-Doctor }
    'focus' {
        switch ($Action.ToLowerInvariant()) {
            'on'     { & (Join-Path $root 'focus\start.ps1') -Minutes $Minutes }
            'off'    { & (Join-Path $root 'focus\stop.ps1') }
            'status' { & (Join-Path $root 'focus\status.ps1') }
            default  { Write-Host 'Uso: mentor focus on [minutos] | off | status' }
        }
    }
    default {
        Write-Host 'Comando desconhecido.' -ForegroundColor Yellow
        Write-Host 'Use: mentor start | progress | doctor | focus on/off/status'
    }
}
