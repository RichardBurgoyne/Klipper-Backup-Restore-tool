#!/usr/bin/env bash
set -e


function main_menu(){
    printf "Klippy Backup\nCreated by m00se"
    gitpath=~/printer_data/config/.git
    if [ ! -d "$gitpath" ]; then
        printf '\n\nAre you using Github or Gitlab?\n'
        select option in Github Gitlab
        do
                case $option in 
                Github|Gitlab)   
                        break
                        ;;
              *)
                        echo "Invalid selection" 
                        ;;
                esac
    done

        if [ $option = "Github" ]; then
            echo github
            github_setup
            checks
            printf '\n\nAre you configuring backups for a new printer or restoring from an old one?\n'
            select option in New Restore
            do
                case $option in 
                New|Restore)   
                            break
                            ;;
                      *)
                            echo "Invalid selection" 
                            ;;
                    esac
            done
            if [ $option = "New" ]; then
                github_init
                printf "\nGithub Setup Completed\n"
                exit
            elif [ $option = "Restore" ]; then
                restorecommand
                printf "\nGithub Restore Completed\n"
                exit
            fi
    

        elif [ $option = "Gitlab" ]; then
            echo gitlab
            gitlab_setup
            echo gitlab init
            checks
            echo gitlab checks
            printf '\n\nAre you configuring backups for a new printer or restoring from an old one?\n'
            select option in New Restore
            do
                    case $option in 
                    New|Restore)   
                            break
                            ;;
                      *)
                            echo "Invalid selection" 
                            ;;
                    esac
            done
            if [ $option = "New" ]; then
                gitlab_init
                printf "\nGitlab Setup Completed\n"
                exit
            elif [ $option = "Restore" ]; then
                restorecommand
                printf "\n Gitlab Restore Completed\n"
                exit
            fi
        fi
    fi

    printf "\nConfirming requirements are met\n"
    checks

    printf '\nPlease select one of the following options\n'

    select option in Backup Restore
        do
                case $option in 
                Backup|Restore)   
                    break
                    ;;
              *)
                echo "Invalid selection" 
                    ;;
                esac
                done
                    
        if [ $option = "Backup" ]; then
            addbackupcommand
            backupcommand
        elif [ $option = "Restore" ]; then
            addrestorecommand
            restorecommand
    fi
} 