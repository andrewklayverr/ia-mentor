[CmdletBinding()]
param(
    [ValidateRange(1, 240)]
    [int]$Minutes = 20
)

$ErrorActionPreference = 'Stop'
$focusDir = $PSScriptRoot
$statePath = Join-Path $focusDir 'state.json'
$configPath = Join-Path $focusDir 'config.json'
$guardPath = Join-Path $focusDir 'guard.ps1'

if (Test-Path $statePath) {
    $old = Get-Content $statePath -Raw | ConvertFrom-Json
    if ($old.active) {
        Write-Host 'O modo foco já está ativo. Use: mentor focus status' -ForegroundColor Yellow
        exit 0
    }
}

$config = Get-Content $configPath -Raw | ConvertFrom-Json
$endAt = (Get-Date).AddMinutes($Minutes)
$process = Start-Process powershell.exe -WindowStyle Hidden -PassThru -ArgumentList @(
    '-NoProfile',
    '-ExecutionPolicy', 'Bypass',
    '-File', ('"{0}"' -f $guardPath),
    '-EndAt', ('"{0}"' -f $endAt.ToString('o'))
)

$state = [ordered]@{
    active = $true
    startedAt = (Get-Date).ToString('o')
    endAt = $endAt.ToString('o')
    guardPid = $process.Id
    sitesApplied = $false
    applications = @($config.applications)
}
$state | ConvertTo-Json -Depth 5 | Set-Content $statePath -Encoding UTF8

# O guardião tenta aplicar os sites. Isso funciona apenas em sessão elevada.
Start-Sleep -Milliseconds 400
Write-Host ("Modo foco ativo por {0} minutos." -f $Minutes) -ForegroundColor Green
Write-Host 'Saída imediata: mentor focus off'

