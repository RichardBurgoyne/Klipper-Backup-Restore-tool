#!/usr/bin/env bash
set -e

function gitlab_setup(){
  printf "\n"
  echo What is your Git Username?
  read vargitusername
  sleep 1

  echo What is your Git Email Address?
  read vargitemail
  sleep 1

  echo What is your Git Token
  read vargittoken
  sleep 1

  echo What is your Git Token Name
  read vargittokenname
  sleep 1

  echo What is your Git Repository URL
  read gitrepo
  #Remove HTTPS/HTTP
  vargitrepo=("${gitrepo##*//}")

  printf "\nYou have provided the following Git details:"
  printf "\nGit Username: $vargitusername"
  printf "\nGit Email Address: $vargitemail"
  printf "\nGit Token: $vargittoken"
  printf "\nGit Token: $vargittokenname"
  printf "\nGit Repo: $vargitrepo\n"
  
  printf "\nIf these details are correct type yes otherwise press any key: "
  read vargitresponse

  if [ "$vargitresponse" != "y" -a "$vargitresponse" != "Y" -a "$vargitresponse" != "Yes" -a "$vargitresponse" != "yes" ]; then
    gitinit
  fi

  cd ~/printer_data/config
  git init
  sleep 1
  git config --global user.name "$vargitusername"
  git config --global user.email "$vargitemail"
  git remote add origin https://$vargittokenname:$vargittoken@$vargitrepo
  git switch --create main
}

#Creates first backup when setting up the script for the first time
function gitlab_init(){
  git switch --create main
  cd ~/printer_data/config/
  git add .
  git commit -m "Initial backup"
  git push -uf origin main
  sleep 1
  echo Setup has been completed
}
