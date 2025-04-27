# System Health Check Script

## Overview
This PowerShell script collects and displays basic system health information, including CPU usage, memory usage, disk space, and system uptime.  
It's designed for quick diagnostics without needing to manually open multiple tools.

## Features
-  CPU Load reporting.
-  Memory Usage reporting.
-  Disk Space usage across all drives.
-  System Uptime since last reboot.
-  (Optional) Export health report to an HTML file for easy sharing or record-keeping.

## How to Use

1. **Clone or download** the repository to your local machine.
2. Open PowerShell.
3. Navigate to the script folder:

    ```powershell
    cd "C:\Path\To\SystemHealthCheck"
    ```

4. **Run the script:**

    ```powershell
    .\System-Health-Check-Script.ps1
    ```

5. The script will display results directly in the console, and (optionally) save a report to your Desktop.

## Requirements
- Windows PowerShell 5.1 or PowerShell Core 7+.
- Administrator privileges may be required to fetch certain system metrics.

## Example Output
```plaintext
CPU Load: 25%
Memory Usage: 45% of 8GB
Disk C:\ 65% free
Disk D:\ 80% free
Last Reboot: 3 days ago        
```

## License
This project is licensed under the MIT License. Feel free to modify and use it for personal or commercial projects.

## Author
Alfa Baye

GitHub: https://github.com/Baye8946





