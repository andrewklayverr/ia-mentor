[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot

$files = @(
    @{ Source = 'student\profile.example.md'; Target = 'student\profile.md' },
    @{ Source = 'student\progress.example.json'; Target = 'student\progress.json' },
    @{ Source = 'student\review-queue.example.json'; Target = 'student\review-queue.json' },
    @{ Source = 'student\mistakes.example.md'; Target = 'student\mistakes.md' },
    @{ Source = 'student\diagnostic.example.md'; Target = 'student\diagnostic.md' },
    @{ Source = 'sessions\current.example.json'; Target = 'sessions\current.json' },
    @{ Source = 'focus\config.example.json'; Target = 'focus\config.json' },
    @{ Source = 'focus\state.example.json'; Target = 'focus\state.json' }
)

foreach ($file in $files) {
    $source = Join-Path $root $file.Source
    $target = Join-Path $root $file.Target
    if (-not (Test-Path $target)) {
        Copy-Item -LiteralPath $source -Destination $target
    }
}
