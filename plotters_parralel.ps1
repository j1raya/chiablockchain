#Begin Script
############Plotters for Temp Drive###############
#"C:\Users\mattd\AppData\Local\chia-blockchain\app-1.1.6\resources\app.asar.unpacked\daemon\chia.exe plots create -k 32 -b 7000 -u 128 -r 6 -t E:\ -d i:\plot -n 1}"
#invoke-expression 'cmd /c start powershell -NoExit -Command {cd "C:\Users\mattd\AppData\Local\chia-blockchain\app-1.1.6\resources\app.asar.unpacked\daemon\";$host.ui.RawUI.WindowTitle = "t1p1"; start-sleep 22000 ; .\chia.exe plots create -k 32 -b 7000 -u 128 -r 6 -t E:\ -d i:\plot -n 1 ;Read-Host -Prompt "press enter to exit"}'


$runs = 10
$plotdelay = 32000
$i = 1
 do{
    If ($alreadyRun) {
        Start-Sleep $plotdelay
        invoke-expression 'cmd /c start powershell -NoExit -Command {C:\Users\mattd\AppData\Local\chia-blockchain\app-1.1.6\resources\app.asar.unpacked\daemon\chia plots create -k 32 -b 7000 -u 128 -r 6 -t E:\ -d i:\plot -n 1}'
    }
    Else {
        $alreadyRun = $true
        invoke-expression 'cmd /c start powershell -NoExit -Command {C:\Users\mattd\AppData\Local\chia-blockchain\app-1.1.6\resources\app.asar.unpacked\daemon\chia plots create -k 32 -b 7000 -u 128 -r 6 -t E:\ -d i:\plot -n 1}'
    }
    $i++
    }
 while ($i -ne $runs)