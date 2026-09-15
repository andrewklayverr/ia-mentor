$statePath = Join-Path $PSScriptRoot 'state.json'
if (-not (Test-Path $statePath)) {
    Write-Host 'Modo foco inativo.'
    exit 0
}

$state = Get-Content $statePath -Raw | ConvertFrom-Json
if (-not $state.active) {
    Write-Host 'Modo foco inativo.'
    exit 0
}

$remaining = [datetime]$state.endAt - (Get-Date)
if ($remaining.TotalSeconds -lt 0) { $remaining = [timespan]::Zero }
Write-Host 'Modo foco: ATIVO' -ForegroundColor Green
Write-Host ("Restante: {0:mm\:ss}" -f $remaining)
Write-Host ("Bloqueio de sites aplicado: {0}" -f $state.sitesApplied)
Write-Host ("Aplicativos monitorados: {0}" -f (@($state.applications) -join ', '))
Write-Host 'Saída imediata: mentor focus off'

