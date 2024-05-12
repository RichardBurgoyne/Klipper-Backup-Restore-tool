#!/bin/bash
set -e

function checks(){
    #Check if gcode_shell_command.py is installed if not download and add it
    shellcommandpath=~/klipper/klippy/extras/gcode_shell_command.py
    if [ ! -f "$shellcommandpath" ]; then
    printf "\n[Shell Command]\n"
    echo gcode_shell_command.py is not in Klippy Extras
    sleep 1
    addshellcommand
    echo gcode_shell_command.py has now been added to Klippy Extras
    fi

#Check if backup.cfg exists, if not download and add it
    backupcfg=~/printer_data/config/backup.cfg
    if [ ! -f "$backupcfg" ]; then
    printf "\n[Backup Config]\n"
    echo backup.cfg has now been downloaded and configured
    sleep 1
    addbackupcfg
    addbackupmacro
    echo backup.cfg has been included in printer.cfg
    fi

#Check if restorecfg.cfg exists, if not download and add it
    restorecfg=~/printer_data/config/restore.cfg
    if [ ! -f "$restorecfg" ]; then
    printf "\n[Restore Config]\n"
    echo restore.cfg has now been downloaded and configured
    sleep 1
    addrestorecfg
    addrestoremacro
    echo restore.cfg has been included in printer.cfg
    fi

#Check if backup_command.sh exists, if not download
    backupcommandsh=/home/$USER/backup_command.sh
    if [ ! -f "$backupcommandsh" ]; then
    sleep 1
    printf "\n[Backup Command Script]\n"
    echo backup_command.sh does not exist, downloading file....
    addbackupcommand
    echo backup_command.sh has now been downloaded
    fi

#Check if restore_command.sh exists, if not download
    restorecommandsh=/home/$USER/restore_command.sh
    if [ ! -f "$restorecommandsh" ]; then
    sleep 1
    printf "\n[Restore Command Script]\n"
    echo restore_command.sh does not exist, downloading file....
    addrestorecommand
    echo restore_command.sh now been downloaded
    fi
}