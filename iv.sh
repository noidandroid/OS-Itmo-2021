#!/bin/bash

if [[ $PWD == $HOME ]]
then
    echo "$HOME"
    exit 0
else
    echo "The process launched not from home directory"
    exit 1
fi