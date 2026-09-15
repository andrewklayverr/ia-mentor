[CmdletBinding()]
param(
    [switch]$FromGuard
)

$ErrorActionPreference = 'SilentlyContinue'
$focusDir = $PSScriptRoot
$statePath = Join-Path $focusDir 'state.json'
$hostsPath = Join-Path $env:SystemRoot 'System32\drivers\etc\hosts'
$startMarker = '# BEGIN FULLSTACK-MENTOR-FOCUS'
$endMarker = '# END FULLSTACK-MENTOR-FOCUS'

$state = $null
if (Test-Path $statePath) { $state = Get-Content $statePath -Raw | ConvertFrom-Json }

if ($state -and -not $FromGuard -and $state.guardPid) {
    Stop-Process -Id ([int]$state.guardPid) -Force -ErrorAction SilentlyContinue
}

if (Test-Path $hostsPath) {
    $content = Get-Content $hostsPath -Raw
    $pattern = '(?ms)^\s*' + [regex]::Escape($startMarker) + '.*?' + [regex]::Escape($endMarker) + '\s*'
    if ($content -match $pattern) {
        $clean = [regex]::Replace($content, $pattern, [Environment]::NewLine)
        Set-Content -Path $hostsPath -Value $clean -Encoding ASCII
        ipconfig /flushdns | Out-Null
    }
}

$inactive = [ordered]@{
    active = $false
    startedAt = if ($state) { $state.startedAt } else { $null }
    endedAt = (Get-Date).ToString('o')
    endAt = if ($state) { $state.endAt } else { $null }
    guardPid = $null
    sitesApplied = $false
    applications = if ($state) { @($state.applications) } else { @() }
}
$inactive | ConvertTo-Json -Depth 5 | Set-Content $statePath -Encoding UTF8

if (-not $FromGuard) { Write-Host 'Modo foco encerrado.' -ForegroundColor Green }

