#!/bin/bash

# Rename files to standard paths, without spaces or special characters

echo -e "\n~~ RENAMED FILES ~~\n"

# Rename each file inside the current folder
ls -p | while read NAME
do
  if [[ ! $NAME =~ /$ ]]
  then
    NEW_NAME=$(echo $NAME | sed -E 's/ +-|- +|[,()#]//g' | sed -E 's/ +/-/g')
    
    if [[ ! $NAME = $NEW_NAME ]]
    then
      mv "$NAME" $NEW_NAME
    
     echo -e "\n$NAME"
    
     echo $NEW_NAME
     
    fi
    
  fi

done

echo '--'

echo -e "\nDONE!"
