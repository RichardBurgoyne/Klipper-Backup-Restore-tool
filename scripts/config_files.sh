#!/bin/bash
set -e

#Download backup.cfg and add it to ~/printer_data/config/
function addbackupcfg(){
    cd ~/printer_data/config/
    wget -q https://raw.githubusercontent.com/housam-s/Klipper-Backup-Restore-tool/main/scripts/config/backup.cfg
    printf "\n[Backup Config File]\n"
    echo backup.cfg has been downloaded and placed in ~/printer_data/config/
    sleep 1
    sed -i 's|replaceme|/home/'$USER'/backup_command.sh |g' ~/printer_data/config/backup.cfg
    echo backup path has been added to the backup.cfg
    sleep 1
}

#Download restore.cfg and add it to ~/printer_data/config/
function addrestorecfg(){
    cd ~/printer_data/config/
    wget -q https://raw.githubusercontent.com/housam-s/Klipper-Backup-Restore-tool/main/scripts/config/restore.cfg
    printf "\n[Restore Config File]\n"
    echo restore.cfg has been downloaded and placed in ~/printer_data/config/
    sleep 1
    sed -i 's|replaceme|/home/'$USER'/restore_command.sh |g' ~/printer_data/config/restore.cfg
    echo backup path has been added to the restore.cfg
    sleep 1
}
