#!/bin/bash

trash=~/.trash
trashlog=~/.trash.log
filename=$1
version=0

if [ $# != 1 ]; then
    echo "Argument Exception: 1 argument must be provided"
    exit 1
fi

if [ ! -d $trash ]; then
    mkdir $trash
fi

if [ ! -f $trashlog ]; then
    touch $trashlog
fi

name="$version"
while [ -f $trash/$trashname ]; do
    (( version++ ))
    name="$version"
done

ln -- "$filename" "$trash/$name"
rm -- "$filename" && echo $(realpath -- "$filename") "$name" >> $trashlog
