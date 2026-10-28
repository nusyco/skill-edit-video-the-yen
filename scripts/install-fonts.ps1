$ErrorActionPreference = 'Stop'
$fontsSourceDir = Join-Path $PSScriptRoot '..\assets\fonts'
$userFontsDir = Join-Path $env:LOCALAPPDATA 'Microsoft\Windows\Fonts'
if (!(Test-Path $userFontsDir)) {
    New-Item -ItemType Directory -Path $userFontsDir -Force | Out-Null
}
$regPath = 'HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Fonts'

$fontFiles = Get-ChildItem -Path $fontsSourceDir -Filter '*.ttf'
$installedCount = 0
foreach ($f in $fontFiles) {
    $destPath = Join-Path $userFontsDir $f.Name
    Copy-Item $f.FullName $destPath -Force
    $fontTitle = "$($f.BaseName) (TrueType)"
    Set-ItemProperty -Path $regPath -Name $fontTitle -Value $destPath -Force
    $installedCount++
}
Write-Host "[OK] Installed $installedCount Vietnamese fonts into $userFontsDir and registered in HKCU."
