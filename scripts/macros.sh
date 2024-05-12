#!/usr/bin/env bash
set -e


#Add a macro to include backup.cfg into printer.cfg
function addbackupmacro(){  
    sed -i '1 i\[include backup.cfg]\n' ~/printer_data/config/printer.cfg
    sleep 1
}

#Add a macro to include restore.cfg into printer.cfg
function addrestoremacro(){   
    sed -i '1 i\[include restore.cfg]\n' ~/printer_data/config/printer.cfg
    sleep 1
}