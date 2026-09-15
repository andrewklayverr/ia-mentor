[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$mentorScript = Join-Path $root 'mentor.ps1'
$initScript = Join-Path $root 'scripts\init-local.ps1'
$binDir = Join-Path ([Environment]::GetFolderPath('LocalApplicationData')) 'FullstackMentor\bin'
$wrapper = Join-Path $binDir 'mentor.cmd'

if (-not (Get-Command codex -ErrorAction SilentlyContinue)) {
    Write-Warning 'Codex CLI não foi encontrado. Instale e autentique o Codex antes de usar o mentor.'
}

if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Warning 'Node.js não foi encontrado. Ele é necessário para os exercícios JavaScript.'
}

& $initScript

New-Item -ItemType Directory -Force -Path $binDir | Out-Null
$wrapperContent = "@echo off`r`npowershell.exe -NoProfile -ExecutionPolicy Bypass -File `"$mentorScript`" %*`r`n"
[System.IO.File]::WriteAllText($wrapper, $wrapperContent, [System.Text.Encoding]::ASCII)

$userPath = [Environment]::GetEnvironmentVariable('Path', 'User')
$entries = @($userPath -split ';' | Where-Object { $_ })
if ($entries -notcontains $binDir) {
    $newPath = (($entries + $binDir) -join ';')
    [Environment]::SetEnvironmentVariable('Path', $newPath, 'User')
    Write-Host 'O comando mentor foi adicionado ao PATH do usuário.' -ForegroundColor Green
}

Write-Host "Instalação concluída em: $root" -ForegroundColor Green
Write-Host 'Abra um novo terminal, execute mentor doctor e depois mentor start.'
