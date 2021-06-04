#Ppwershell parallel plotters, initial draft with harcoded vars
Function get-freeGB ($threshold) {
    $Volume = Get-WmiObject -Class Win32_Volume -Filter "DriveLetter = 'E:'"
    $freeGB = $Volume.FreeSpace/1GB
    return $freeGB
}
Function set-logDate {
    $runDate = Get-Date -Format "yyyy/MM/dd HHmmss"
    return "$runDate"
}
$runs = 10
$plotdelay = 30000
$i = 1
Function freeGBr {
    $freeGBr = [math]::Round((get-freeGB),2)
    return $freeGBr
}
do{
while ((get-freeGB) -le '290') {
    Write-Output ([string](set-logDate) + [string](" : Not enough space (" + $(freeGBr) + " GB) - pausing for 5 mins"))
    Start-Sleep 300
    } 
    Write-Output ([string](set-logDate) + [string](" : Free space is  " + $(freeGBr) + " GB - continuing."))
    Write-Output ([string](set-logDate) + [string](" : starting loop $i"))
    invoke-expression 'cmd /c start powershell -NoExit -Command {C:\Users\mattd\AppData\Local\chia-blockchain\app-1.1.6\resources\app.asar.unpacked\daemon\chia plots create -k 32 -b 7000 -u 128 -r 6 -t E:\ -d i:\karuma -n 1}'
    #$plotTime = measure-command {invoke-expression 'cmd /c start powershell -NoExit -Command {C:\Users\mattd\AppData\Local\chia-blockchain\app-1.1.6\resources\app.asar.unpacked\daemon\chia plots create -k 32 -b 7000 -u 128 -r 6 -t E:\ -d i:\karuma -n 1}'}
    #$plotTimesecs = $plotTime.TotalSeconds
    #wrote-output [string](Get-Date -Format "yyyy/MM/dd HHmmss") + [string](" : Last run $plotTimesecs, adjusting next plot delay")
    Start-Sleep $plotdelay
    #clear-variable plotTimesecs
    $i++
    }
while ($i -ne $runs)
clear-Variable i