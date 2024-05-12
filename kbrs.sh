#!/usr/bin/env bash

###########################
## Klipper Backup & Restore Script ##
#### Created by m00se #####
###########################

clear

KBRS_SRCDIR="$(dirname -- "$(readlink -f "${BASH_SOURCE[0]}")")"
for script in "${KBRS_SRCDIR}/scripts/"*.sh; do . "${script}"; done
for script in "${KBRS_SRCDIR}/scripts/remote_locations/"*.sh; do . "${script}"; done

check_euid
main_menu
