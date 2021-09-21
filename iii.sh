#!/bin/bash

input=0
while [[ $input -eq 0 ]]
do
    echo "## menu ##"
    echo "1. nano"
    echo "2. vi"
    echo "3. links"
    echo "4. exit"

    read input
    case $input in
        1)
            nano
            input=1
            ;;
        2)
            vi
            input=2
            ;;
        3)
            links
            input=3
            ;;
        4)
            input=4
            ;;
        *)
            input=0
            ;;
     esac
done

exit 0