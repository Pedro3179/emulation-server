#!/bin/bash

# Rename files to standard paths, without spaces or special characters

# Ask the user for the target folder or file
read TARGET

CURRENT_DIR="$PWD/$TARGET"

echo "$CURRENT_DIR"

# Rename each file inside the current folder
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
