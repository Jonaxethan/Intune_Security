#Author Jonaxethan
#Date 2023-10-16
#Version 1.0
#Description: This script checks the Status from MS Defender on Windows Devices

$DefenderStatus = Get-MpComputerStatus
Switch($DefenderStatus.AMRunningMode){
    "Active" {
        Write-Host "Microsoft Defender Antivirus is running in Active Mode." -ForegroundColor Green
    }
    "EDR Block Mode" {
        Write-Host "Microsoft Defender Antivirus is running in Passive Mode." -ForegroundColor Yellow
    }
    "passive" {
        Write-Host "Microsoft Defender Antivirus is running in Passive Mode." -ForegroundColor Yellow
        exit 1
    }
    "Disabled" {
        Write-Host "Microsoft Defender Antivirus is Disabled." -ForegroundColor Red
        exit 1
    }
    Default {
        Write-Host "Unknown status: $($DefenderStatus.AMRunningMode)" -ForegroundColor Red
        exit 1
    }
}
