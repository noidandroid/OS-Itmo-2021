#!/bin/bash

processes=$(ps -U root --format pid,command | awk '{print $1" : "$2}')
count=$(echo "$processes" | wc -l)
let "count=count-1"

echo "Count is $count" > 2_01.txt
echo "$processes" >> 2_01.txt
