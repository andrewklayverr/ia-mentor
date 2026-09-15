[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [datetime]$EndAt
)

$ErrorActionPreference = 'SilentlyContinue'
$focusDir = $PSScriptRoot
$configPath = Join-Path $focusDir 'config.json'
$statePath = Join-Path $focusDir 'state.json'
$stopPath = Join-Path $focusDir 'stop.ps1'
$config = Get-Content $configPath -Raw | ConvertFrom-Json
$hostsPath = Join-Path $env:SystemRoot 'System32\drivers\etc\hosts'
$startMarker = '# BEGIN FULLSTACK-MENTOR-FOCUS'
$endMarker = '# END FULLSTACK-MENTOR-FOCUS'

function Test-Administrator {
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($identity)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

if ((Test-Administrator) -and (Test-Path $hostsPath)) {
    $content = Get-Content $hostsPath -Raw
    if ($content -notmatch [regex]::Escape($startMarker)) {
        $lines = @('', $startMarker)
        foreach ($site in $config.sites) {
            if ($site -match '^[a-zA-Z0-9.-]+$') { $lines += "0.0.0.0 $site" }
        }
        $lines += $endMarker
        Add-Content -Path $hostsPath -Value ($lines -join [Environment]::NewLine)
        ipconfig /flushdns | Out-Null
        $state = Get-Content $statePath -Raw | ConvertFrom-Json
        $state.sitesApplied = $true
        $state | ConvertTo-Json -Depth 5 | Set-Content $statePath -Encoding UTF8
    }
}

while ((Get-Date) -lt $EndAt) {
    if (-not (Test-Path $statePath)) { break }
    $state = Get-Content $statePath -Raw | ConvertFrom-Json
    if (-not $state.active) { break }

    foreach ($name in $config.applications) {
        if ($name -match '^[a-zA-Z0-9._-]+$') {
            Get-Process -Name $name -ErrorAction SilentlyContinue | Stop-Process -Force
        }
    }
    Start-Sleep -Seconds ([Math]::Max(2, [int]$config.pollSeconds))
}

& $stopPath -FromGuard

