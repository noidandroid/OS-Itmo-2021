#!/bin/bash

IFS=$'\n'

for email in $(grep -E -i -o -r -h -s "[0-9A-Za-z_.]+@[0-9A-Za-z]+(\.[0-9A-Za-z]+)+" /etc)
do
  echo -n $email", "
done > emails.lst
