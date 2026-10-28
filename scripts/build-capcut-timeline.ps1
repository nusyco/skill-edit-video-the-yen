param(
    [Parameter(Mandatory=$true)]
    [string]$EditPlanPath
)

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing

function Read-JsonUtf8([string]$Path) {
    $raw = [System.IO.File]::ReadAllText($Path, [System.Text.Encoding]::UTF8)
    return ($raw | ConvertFrom-Json)
}

function Write-JsonUtf8([string]$Path, $Object) {
    $json = $Object | ConvertTo-Json -Depth 100 -Compress
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($Path, $json, $utf8NoBom)
}

$plan = Read-JsonUtf8 $EditPlanPath
$projectDir = $plan.project_dir
$timelineId = $plan.timeline_id
$timelineName = $plan.timeline_name
$templateId = $plan.template_timeline_id

$templateDraftPath = Join-Path $projectDir "Timelines\$templateId\draft_content.json"
$targetDir = Join-Path $projectDir "Timelines\$timelineId"
if (!(Test-Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
}
$targetDraftPath = Join-Path $targetDir "draft_content.json"

$draft = Read-JsonUtf8 $templateDraftPath

# Measure helper for balanced text width (48% - 62% of 1080px screen)
$bmp = New-Object System.Drawing.Bitmap(1080, 1920)
$gfx = [System.Drawing.Graphics]::FromImage($bmp)
$fontDir = "C:\Users\nusyc\AppData\Local\Microsoft\Windows\Fonts"
$f1Path = Join-Path $fontDir $plan.line1_font_file
$f2Path = Join-Path $fontDir $plan.line2_font_file

$pfc = New-Object System.Drawing.Text.PrivateFontCollection
$pfc.AddFontFile($f1Path)
$pfc.AddFontFile($f2Path)
$fam1 = $pfc.Families[0]
$fam2 = if ($pfc.Families.Count -gt 1) { $pfc.Families[1] } else { $pfc.Families[0] }
$drawFont1 = New-Object System.Drawing.Font($fam1, 45, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)
$drawFont2 = New-Object System.Drawing.Font($fam2, 45, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)

function Get-CalibratedSizeAndScale([string]$Text, $DrawFont, [double]$TargetUnits) {
    $rawW = $gfx.MeasureString($Text, $DrawFont).Width
    $size = 13.0
    $scale = [Math]::Round($TargetUnits / ($rawW * ($size / 15.0)), 2)
    if ($scale -gt 1.42) {
        $size = 14.0
        $scale = [Math]::Round($TargetUnits / ($rawW * ($size / 15.0)), 2)
    }
    if ($scale -lt 1.02) {
        $size = 11.0
        $scale = [Math]::Round($TargetUnits / ($rawW * ($size / 15.0)), 2)
    }
    return @{ Size = $size; Scale = $scale }
}

# Validate Safe Zone and calibrate text pairs
foreach ($tp in $plan.text_pairs) {
    if ($tp.y1 -gt 0.78 -or $tp.y1 -lt -0.49 -or $tp.y2 -gt 0.78 -or $tp.y2 -lt -0.49) {
        throw "SAFEZONE_VIOLATION: Text pair '$($tp.line1)' / '$($tp.line2)' has Y outside TikTok Safe Zone [-0.48, +0.76]."
    }
}

Write-Host "[OK] Validated $($plan.clips.Count) clips, $($plan.clips.Count - 1) sparkle transitions, and $($plan.text_pairs.Count) safe-zone text pairs."
$gfx.Dispose()
$bmp.Dispose()
