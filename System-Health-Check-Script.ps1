# System Health Check Script
# Author: Alfa Baye
# Date: 2025-04-26
# Purpose: Collect system health info and report

# CPU Usage
$cpu = Get-CimInstance -ClassName Win32_Processor | Select-Object -ExpandProperty LoadPercentage

# Memory Usage
$memory = Get-CimInstance -ClassName Win32_OperatingSystem
$totalMemory = [math]::Round($memory.TotalVisibleMemorySize / 1MB, 2)
$freeMemory = [math]::Round($memory.FreePhysicalMemory / 1MB, 2)
$usedMemory = [math]::Round($totalMemory - $freeMemory, 2)

# Disk Space Usage
$disk = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DeviceID='C:'"
$totalDisk = [math]::Round($disk.Size / 1GB, 2)
$freeDisk = [math]::Round($disk.FreeSpace / 1GB, 2)
$usedDisk = [math]::Round($totalDisk - $freeDisk, 2)

# Last Reboot
$lastBootTime = (Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime
$uptimeDays = (Get-Date) - $lastBootTime
$uptimeFormatted = "{0:N0}" -f $uptimeDays.TotalDays

# Display Health Report
$healthReport = [PSCustomObject]@{
    "CPU Load (%)"       = $cpu
    "Memory Used (GB)"   = "$usedMemory GB of $totalMemory GB"
    "Disk Used (GB)"     = "$usedDisk GB of $totalDisk GB"
    "Last Reboot"        = $lastBootTime
    "Uptime (Days)"      = $uptimeFormatted
}

$healthReport | Format-Table -AutoSize

# Optional: Export to HTML
$healthReport | ConvertTo-Html -Title "System Health Report" | Out-File -FilePath "$env:USERPROFILE\Desktop\SystemHealthReport.html"
Write-Host "Script Path: $($MyInvocation.MyCommand.Path)"
Write-Host "Script Folder: $PSScriptRoot"
