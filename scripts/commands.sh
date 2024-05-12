#!/bin/bash
set -e

###gcode_shell_command.py###

#Download gcode_shell_command.py and place it in~/klipper/klippy/extras/
function addshellcommand(){ 
    cd ~/klipper/klippy/extras/
    wget -q https://raw.githubusercontent.com/housam-s/Klipper-Backup-Restore-tool/main/scripts/gcode_shell_command.py
    sleep 1
}

function addbackupcommand(){
    cd /home/$USER/
    if [ ! -f "backup_command.sh" ]; then
    wget -q https://raw.githubusercontent.com/housam-s/Klipper-Backup-Restore-tool/main/scripts/backup_command.sh
    fi
}

#The backup command to push backups to githhub
function backupcommand(){
    /bin/bash backup_command.sh
    exit
}

function addrestorecommand(){
    cd /home/$USER/
    if [ ! -f "restore_command.sh" ]; then
    wget -q https://raw.githubusercontent.com/housam-s/Klipper-Backup-Restore-tool/main/scripts/restore_command.sh
    fi
}

function restorecommand(){
    /bin/bash restore_command.sh
    exit
}
