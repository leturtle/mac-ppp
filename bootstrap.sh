#!/usr/bin/env bash

DIR=/etc/ppp

init_file () {
  local filename=$1
  if [ -f "$DIR/$filename" ]; then
    echo "remove exists $filename"
    rm "$DIR/$filename"
  fi

  echo "copy $filename"
  cp $filename $DIR
 
  echo "change $filename previlege"
  chmod 755 /etc/ppp/$filename
}

init_file ip-up
init_file ip-down
