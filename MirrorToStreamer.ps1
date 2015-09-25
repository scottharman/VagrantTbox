#<BEGIN_SCRIPT>#

#<Set Path to be monitored>#
$SourcePath = "E:\Streamer\"
$DestPath = "\\wdtvlivehub\wdtvlivehub\"
#$DestPath = "E:\Videos\"

$fsw = new-object System.IO.FileSystemWatcher $SourcePath -Property @{
    IncludeSubDirectories="true"
    NotifyFilter = [System.IO.NotifyFilters]'Filename, LastWrite'
}

$onCreated = Register-ObjectEvent $fsw Created -SourceIdentifier FileCreated -Action {
    Start-Sleep -s 600
    $SourcePath = "E:\Streamer\"
    $DestPath = "\\wdtvlivehub\wdtvlivehub\"
    #$DestPath = "E:\Videos\"
    $path = $Event.SourceEventArgs.FullPath
    $name = $Event.SourceEventArgs.Name
    $changeType = $Event.SourceEventArgs.ChangeType
    $timeStamp = $Event.TimeGenerated

    If ((Test-Path $DestPath$name) -eq $false) {
        New-Item -ItemType File -Path $DestPath$name -Force
    }
    Copy-Item -Path $SourcePath\$name -Destination $DestPath\$name -recurse -Force

}
$trigger = New-JobTrigger -AtStartup -RandomDelay 00:00:30
Register-ScheduledJob -Trigger $trigger -FilePath E:\VagrantTbox\MirrorToStreamer.ps1 -Name MirrorToStreamer
