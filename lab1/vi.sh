#!/bin/bash

FILE="/var/log/anaconda/X.log"

sed -n '/error/p "$FILE" >full.log
sed '/error/d' "$FILE" >full.log
sed 's/warn/Warning:/g' full.log >"curr"
sed 's/info/Information:/g' "curr" >full.log"
rm curr
