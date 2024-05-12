#Restore your latest backup from Github
function restore(){
  cd ~/printer_data/config
  echo Retrieving updates
  sleep 1
  git fetch
  git reset --hard origin/master
}

