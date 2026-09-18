#!/bin/bash

# Rename files to standard paths, without spaces or special characters

# Rename each file inside the current folder
CURRENT_DIR="$PWD/$1"

echo "$CURRENT_DIR"

echo -e "\n~~ RENAMED FILES ~~\n"

ls -p $CURRENT_DIR | while read NAME
do
  if [[ ! $NAME =~ /$ ]]
  then
    NEW_NAME=$(echo $NAME | sed -E 's/ +-|- +|[,()#]//g' | sed -E 's/ +/-/g')
    
    if [[ ! $NAME = $NEW_NAME ]]
    then
      mv "$CURRENT_DIR/$NAME" "$CURRENT_DIR"/$NEW_NAME
    
     echo -e "\n$NAME"
    
     echo $NEW_NAME
     
    fi
    
  fi

done

echo '--'

echo -e "\nDONE!"
