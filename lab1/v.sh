#!/bin/bash

IFS=$'\n'

for string in $(grep -rh "INFO" /var/log/anaconda/syslog)
do
  if [[ $(string) == "INFO" ]]
  then
  echo $string
  fi
done > info.log
