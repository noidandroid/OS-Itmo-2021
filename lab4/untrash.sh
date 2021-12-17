#!/bin/bash

dir=../.trash
log=../.trash.log

if [[ $# != 1 ]];
  then
      echo "Arguments exception: need 1 argument to be passed"
      exit 1
  fi


restore_file () {
    path=$1
    filename=$2
    ln -- $dir/"$filename" "$path"
}


filename=$1
line=""
grep -- "$filename" $log |
while read line; do
    fullpath=$(echo "$line" | awk -F"'" '{print $1}')
    fileRestore=$(dirname "$fullpath")
    fileTrash=$(echo "$line" | awk '{print $NF}')

    echo "Want to restore? (y/n)"
    read answer < /dev/tty
    case  "$answer" in
    "y")
        parent_directory="$fileRestore" &&
            if [[ -d "$parent_directory" ]]; then
                $(restore_file "$fileRestore" "$fileTrash")
            else
                $(restore_file "$HOME/$filename" "$fileTrash") &&
                echo "Directory $parent_directory not exists anymore, restoring at $HOME"
            fi &&
            rm -- $dir/"$fileTrash" && echo "$filename was successfully restored"
	;;
     "n")
        ;;
      *)
       echo "INVALID COMMAND"
       ;;
 esac
done
