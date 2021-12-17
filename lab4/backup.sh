#!/bin/bash

backupsFolder=$(ls $HOME/*/ | grep -o -E "Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}")

lastBackupTimeInSeconds=0
lastBackupFolder=""

report="$HOME/backup-report"

if [[ $backupsFolder ]]
then
  	lastBackupFolder=$(echo "$backupsFolder" | tail -1)
  	lastBackupDate=$(echo "$lastBackupFolder" | grep -o -E "[0-9]{4}-[0-9]{2}-[0-9]{2}")
  	lastBackupTimeInSeconds=$(date -d $lastBackupDate +%s)
fi

sourceFolder="$HOME/source"
if [[ ! -d "$sourceFolder" ]]
then
	echo "Source folder not found"
	exit 1
fi

nowDate=`date +%Y-%m-%d`
nowDateSeconds=$(date -d $nowDate +%s)
folderToBackup=""
isBackupNew=false

if [[ $nowDateSeconds -gt $lastBackupTimeInSeconds+7*24*60*60 ]]
then
  	folderToBackup="$HOME/Backup-$nowDate"
  	mkdir $folderToBackup
  	isBackupNew=true
else
  	folderToBackup="$HOME/$lastBackupFolder"
fi


cd "$sourceFolder"
filesToBackup=$(find . -type f)

if [[ $isBackupNew == true ]]
then
	echo "$folderToBackup: created at $current_time" >> $report
	for curFile in $filesToBackup
		do
    		cp --parents "$curFile" "$folderToBackup/"
			echo "$curFile copied to $folderToBackup at $nowDate" >> $report
  		done
else
	for curFile in $filesToBackup
		do
    		if [[ -e "$folderToBackup/$curFile" ]]
			then
				sizeOld=$(stat -c%s "$folderToBackup/$curFile")
				sizeNew=$(stat -c%s "$sourceFolder/$curFile")
      				if [[ $sizeOld -ne $sizeNew ]]; then
        				   mv "$folderToBackup/$curFile" "$folderToBackup/$curFile.$nowDate"
        				   cp "$sourceFolder/$curFile" "$folderToBackup/$curFile"
        				   echo "$curFile was renamed to $curFile.$nowDate at $nowDate" >> $report
        				   echo "$curFile was copied to $folderToBackup at $nowDate" >> $report
      				fi
    			else
      				cp --parents "$curFile" "$backup_directory/"
      				echo "$curFile was copied to $folderToBackup at $nowDate" >> $report
    			fi
  		done
fi


