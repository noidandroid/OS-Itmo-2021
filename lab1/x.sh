#!/bin/bash

man $1 |
tr -cs '[:alpha:]' '\n' | sed 's/[A-Z]/\L&/g' |
sort | uniq -c | sort -n -r |
awk -F' ' '{if (length($2) >= 4) print $2}' |
head -3
