#!/bin/bash

IFS=$'\n'

for string in $(grep -rh "INFO" /var/log/anaconda/syslog)
do
  echo $string
done > info.log
