#!/usr/bin/env bash
set -e


function check_euid() {
    if [[ ${EUID} -eq 0 ]]; then
    echo -e "${red}"
    top_border
    echo -e "|       !!! THIS SCRIPT MUST NOT RUN AS ROOT !!!        |"
    echo -e "|                                                       |"
    echo -e "|        It will ask for credentials as needed.         |"
    bottom_border
    echo -e "${white}"
    exit 1
    fi
}