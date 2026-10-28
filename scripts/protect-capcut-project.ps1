param(
    [Parameter(Mandatory=$true)]
    [string]$ProjectDir,
    [Parameter(Mandatory=$true)]
    [string]$BackupDir,
    [Parameter(Mandatory=$true)]
    [string]$TimelineId,
    [Parameter(Mandatory=$true)]
    [string]$BackupDraftFileName
)

$tDir = Join-Path $ProjectDir "Timelines\$TimelineId"
$backupDraftPath = Join-Path $BackupDir $BackupDraftFileName

function Restore-CapCutState {
    if (!(Test-Path $tDir)) { New-Item -ItemType Directory -Path $tDir -Force | Out-Null }
    Copy-Item $backupDraftPath (Join-Path $tDir 'draft_content.json') -Force
    if (Test-Path (Join-Path $BackupDir 'project_backup.json')) {
        Copy-Item (Join-Path $BackupDir 'project_backup.json') (Join-Path $ProjectDir 'project.json') -Force
    }
    if (Test-Path (Join-Path $BackupDir 'timeline_layout_backup.json')) {
        Copy-Item (Join-Path $BackupDir 'timeline_layout_backup.json') (Join-Path $ProjectDir 'timeline_layout.json') -Force
    }
    if (Test-Path (Join-Path $BackupDir 'draft_biz_config_backup.json')) {
        Copy-Item (Join-Path $BackupDir 'draft_biz_config_backup.json') (Join-Path $ProjectDir 'draft_biz_config.json') -Force
    }
}

Restore-CapCutState
$expectedLen = (Get-Item $backupDraftPath).Length

while ($true) {
    Start-Sleep -Milliseconds 150
    try {
        $curLen = (Get-Item (Join-Path $tDir 'draft_content.json') -ErrorAction Stop).Length
        if ($curLen -ne $expectedLen) {
            Start-Sleep -Milliseconds 120
            Restore-CapCutState
        }
    } catch {
        Restore-CapCutState
    }
}
