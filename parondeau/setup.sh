#!/usr/bin/env bash

DIR=$(pwd)
files=$(ls -a | grep -v "\.$" | grep -v ".swp" | grep -v "setup.sh")
for file in $files;
do
  echo "symlinking $file"
  ln -s $DIR/$file ~/
  echo ""
done
