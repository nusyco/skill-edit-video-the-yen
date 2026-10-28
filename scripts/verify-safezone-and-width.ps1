param(
    [Parameter(Mandatory=$true)]
    [string]$EditPlanPath,
    [Parameter(Mandatory=$true)]
    [string]$OutputImagePath
)

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing

$raw = [System.IO.File]::ReadAllText($EditPlanPath, [System.Text.Encoding]::UTF8)
$plan = $raw | ConvertFrom-Json

$fontDir = "C:\Users\nusyc\AppData\Local\Microsoft\Windows\Fonts"
$pfc = New-Object System.Drawing.Text.PrivateFontCollection
$pfc.AddFontFile((Join-Path $fontDir $plan.line1_font_file))
$pfc.AddFontFile((Join-Path $fontDir $plan.line2_font_file))
$fam1 = $pfc.Families[0]
$fam2 = if ($pfc.Families.Count -gt 1) { $pfc.Families[1] } else { $pfc.Families[0] }

$cols = 3
$rows = [Math]::Ceiling($plan.text_pairs.Count / 3.0)
$cellW = 540
$cellH = 960
$canvas = New-Object System.Drawing.Bitmap(($cols * $cellW), ($rows * $cellH))
$g = [System.Drawing.Graphics]::FromImage($canvas)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit

$redDeadBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(95, 230, 40, 40))
$greenSafePen = New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(220, 40, 220, 100), 3)
$goldBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 249, 222, 144))
$whiteBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)
$brownPen = New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(230, 88, 61, 39), 4)

$sf = New-Object System.Drawing.StringFormat
$sf.Alignment = [System.Drawing.StringAlignment]::Center
$sf.LineAlignment = [System.Drawing.StringAlignment]::Center

for ($i = 0; $i -lt $plan.text_pairs.Count; $i++) {
    $tp = $plan.text_pairs[$i]
    $col = $i % $cols
    $row = [Math]::Floor($i / $cols)
    $ox = $col * $cellW
    $oy = $row * $cellH

    # Find matching clip at midpoint of text pair
    $midUs = $tp.start_us + ($tp.duration_us / 2)
    $acc = 0
    $clipPath = $plan.clips[0].path
    $offsetSec = 1.0
    foreach ($c in $plan.clips) {
        if ($midUs -ge $acc -and $midUs -le ($acc + $c.duration_us)) {
            $clipPath = $c.path
            $offsetSec = [Math]::Round(($midUs - $acc + $c.source_start_us) / 1000000.0, 2)
            break
        }
        $acc += $c.duration_us
    }

    $tmpFrame = Join-Path $env:TEMP "safezone_frame_$i.jpg"
    & ffmpeg -y -ss $offsetSec -i $clipPath -frames:v 1 -q:v 2 $tmpFrame 2>$null
    if (Test-Path $tmpFrame) {
        $img = [System.Drawing.Image]::FromFile($tmpFrame)
        $g.DrawImage($img, $ox, $oy, $cellW, $cellH)
        $img.Dispose()
    }

    # Draw TikTok Dead Zones (Top > +0.82, Bottom < -0.50, Right > +0.72)
    $topDeadH = [int]((1.0 - 0.82) / 2.0 * $cellH)
    $botDeadY = [int]((1.0 - (-0.50)) / 2.0 * $cellH)
    $rightDeadX = [int]((1.0 + 0.72) / 2.0 * $cellW)
    $g.FillRectangle($redDeadBrush, $ox, $oy, $cellW, $topDeadH)
    $g.FillRectangle($redDeadBrush, $ox, $oy + $botDeadY, $cellW, $cellH - $botDeadY)
    $g.FillRectangle($redDeadBrush, $ox + $rightDeadX, $oy + [int]($cellH * 0.40), $cellW - $rightDeadX, $botDeadY - [int]($cellH * 0.40))

    # Draw Safe Zone Green Box
    $safeX = $ox + [int]((1.0 - 0.72) / 2.0 * $cellW)
    $safeW = [int](0.72 * $cellW)
    $safeY = $oy + $topDeadH
    $safeH = $botDeadY - $topDeadH
    $g.DrawRectangle($greenSafePen, $safeX, $safeY, $safeW, $safeH)

    # Render Line 1 and Line 2 at exact Y1, Y2
    $py1 = $oy + [int]((1.0 - $tp.y1) / 2.0 * $cellH)
    $py2 = $oy + [int]((1.0 - $tp.y2) / 2.0 * $cellH)
    $f1 = New-Object System.Drawing.Font($fam1, 24, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)
    $f2 = New-Object System.Drawing.Font($fam2, 26, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)
    $g.DrawString($tp.line1, $f1, $goldBrush, ($ox + $cellW / 2), $py1, $sf)
    $g.DrawString($tp.line2, $f2, $whiteBrush, ($ox + $cellW / 2), $py2, $sf)
    $f1.Dispose()
    $f2.Dispose()
}

$canvas.Save($OutputImagePath, [System.Drawing.Imaging.ImageFormat]::Png)
$g.Dispose()
$canvas.Dispose()
Write-Host "[OK] Saved Safe Zone verification composite to: $OutputImagePath"
