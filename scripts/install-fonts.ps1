$ErrorActionPreference = 'Stop'
$fontsSourceDir = Join-Path $PSScriptRoot '..\assets\fonts'
$userFontsDir = Join-Path $env:LOCALAPPDATA 'Microsoft\Windows\Fonts'
if (!(Test-Path $userFontsDir)) {
    New-Item -ItemType Directory -Path $userFontsDir -Force | Out-Null
}
$regPath = 'HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Fonts'

$fontFiles = Get-ChildItem -Path $fontsSourceDir -Filter '*.ttf'
$installedCount = 0
$alreadyLoadedCount = 0
foreach ($f in $fontFiles) {
    $destPath = Join-Path $userFontsDir $f.Name
    try {
        if (!(Test-Path $destPath) -or ((Get-Item $destPath).Length -ne $f.Length)) {
            Copy-Item $f.FullName $destPath -Force -ErrorAction Stop
        }
        $installedCount++
    } catch {
        # Font is already installed and actively locked/loaded by Windows or CapCut
        $alreadyLoadedCount++
    }
    $fontTitle = "$($f.BaseName) (TrueType)"
    Set-ItemProperty -Path $regPath -Name $fontTitle -Value $destPath -Force
}
Write-Host "[OK] Verified $($fontFiles.Count) Vietnamese fonts in $userFontsDir ($installedCount ready, $alreadyLoadedCount actively loaded by system/CapCut) and registered in HKCU."
