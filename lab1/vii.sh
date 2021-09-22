#!/bin/bash

IFS=$'\n'

for email in $(grep -Eiorh "[0-9A-Za-z_.]+@[0-9A-Za-z]+(\.[0-9A-Za-z]+)+" /etc)
do
  echo -n $email", "
done > emails.lst
