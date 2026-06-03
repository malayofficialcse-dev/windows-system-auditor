```bash
#!/bin/bash

clear

while true
do
    clear

    echo "=========================================================="
    echo "             ULTIMATE LINUX ADMIN TOOLKIT"
    echo "=========================================================="
    echo
    echo "1. System Information"
    echo "2. Network Information"
    echo "3. Running Processes"
    echo "4. Services"
    echo "5. User Accounts"
    echo "6. Disk Information"
    echo "7. Security Audit"
    echo "8. Environment Variables"
    echo "9. Generate Full Report"
    echo "10. Cleanup Temp Files"
    echo "11. Startup Programs"
    echo "12. Installed Drivers"
    echo "13. Scheduled Tasks"
    echo "14. Open Ports"
    echo "15. Exit"
    echo

    read -p "Select Option: " choice

    case $choice in

    1)
        clear
        echo "SYSTEM INFORMATION"
        echo "=================="
        hostname
        echo
        uname -a
        echo
        cat /etc/os-release
        echo
        uptime
        read -p "Press Enter to continue..."
        ;;

    2)
        clear
        echo "NETWORK INFORMATION"
        echo "==================="
        ip addr
        echo
        ip route
        echo
        cat /etc/resolv.conf
        read -p "Press Enter to continue..."
        ;;

    3)
        clear
        echo "RUNNING PROCESSES"
        echo "================="
        ps aux
        read -p "Press Enter to continue..."
        ;;

    4)
        clear
        echo "SERVICES"
        echo "========"
        systemctl list-units --type=service
        read -p "Press Enter to continue..."
        ;;

    5)
        clear
        echo "USERS"
        echo "====="
        cut -d: -f1 /etc/passwd
        echo
        who
        read -p "Press Enter to continue..."
        ;;

    6)
        clear
        echo "DISK INFORMATION"
        echo "================"
        df -h
        echo
        lsblk
        read -p "Press Enter to continue..."
        ;;

    7)
        clear
        echo "SECURITY AUDIT"
        echo "=============="
        echo
        echo "FIREWALL STATUS"
        sudo ufw status 2>/dev/null
        echo
        echo "FAILED SERVICES"
        systemctl --failed
        read -p "Press Enter to continue..."
        ;;

    8)
        clear
        echo "ENVIRONMENT VARIABLES"
        echo "====================="
        env
        read -p "Press Enter to continue..."
        ;;

    9)
        clear

        REPORT="system_report.txt"

        echo "Generating Full Report..."

        echo "===== SYSTEM REPORT =====" > $REPORT

        echo "" >> $REPORT
        echo "HOSTNAME" >> $REPORT
        hostname >> $REPORT

        echo "" >> $REPORT
        echo "SYSTEM INFO" >> $REPORT
        uname -a >> $REPORT

        echo "" >> $REPORT
        echo "OS RELEASE" >> $REPORT
        cat /etc/os-release >> $REPORT

        echo "" >> $REPORT
        echo "NETWORK INFO" >> $REPORT
        ip addr >> $REPORT

        echo "" >> $REPORT
        echo "USERS" >> $REPORT
        cut -d: -f1 /etc/passwd >> $REPORT

        echo "" >> $REPORT
        echo "DISKS" >> $REPORT
        df -h >> $REPORT

        echo "" >> $REPORT
        echo "PROCESSES" >> $REPORT
        ps aux >> $REPORT

        echo "" >> $REPORT
        echo "SERVICES" >> $REPORT
        systemctl list-units --type=service >> $REPORT

        echo "" >> $REPORT
        echo "OPEN PORTS" >> $REPORT
        ss -tulnp >> $REPORT

        echo
        echo "REPORT GENERATED:"
        echo "$REPORT"

        read -p "Press Enter to continue..."
        ;;

    10)
        clear
        echo "CLEANING TEMP FILES..."

        rm -rf /tmp/* 2>/dev/null

        echo "COMPLETED"

        read -p "Press Enter to continue..."
        ;;

    11)
        clear
        echo "STARTUP PROGRAMS"
        echo "================"

        systemctl list-unit-files --type=service | grep enabled

        read -p "Press Enter to continue..."
        ;;

    12)
        clear
        echo "INSTALLED DRIVERS"
        echo "================="

        lsmod

        read -p "Press Enter to continue..."
        ;;

    13)
        clear
        echo "SCHEDULED TASKS"
        echo "==============="

        crontab -l 2>/dev/null
        echo
        ls /etc/cron.d 2>/dev/null

        read -p "Press Enter to continue..."
        ;;

    14)
        clear
        echo "OPEN PORTS"
        echo "=========="

        ss -tulnp

        read -p "Press Enter to continue..."
        ;;

    15)
        echo "Exiting..."
        exit 0
        ;;

    *)
        echo "Invalid Option"
        sleep 2
        ;;

    esac

done
```
