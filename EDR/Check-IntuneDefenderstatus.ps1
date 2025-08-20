#Author Jonaxethan
#Date 2025-08-10
#Version 1.0
#Description: This script checks the Status from MS Defender on Windows Devices

$DefenderStatus = Get-MpComputerStatus
$EXITCODE = 0
Switch($DefenderStatus.AMRunningMode){
    "Active" {
        Write-Host "Microsoft Defender Antivirus is running in Active Mode." -ForegroundColor Green
    }
    "EDR Block Mode" {
        Write-Host "Microsoft Defender Antivirus is running in Block Mode." -ForegroundColor Yellow
    }
    "passive" {
        Write-Host "Microsoft Defender Antivirus is running in Passive Mode." -ForegroundColor Yellow
        $EXITCODE = 1
    }
    "Disabled" {
        Write-Host "Microsoft Defender Antivirus is Disabled." -ForegroundColor Red
        $EXITCODE = 1
    }
    Default {
        Write-Host "Unknown status: $($DefenderStatus.AMRunningMode)" -ForegroundColor Red
        $EXITCODE = 1
    }
}

exit $EXITCODE