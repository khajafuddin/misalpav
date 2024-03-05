#!/bin/bash

echo -n "Enter Source folder name: "
read sdir
echo -n "Enter dest folder name: "
read ddir
echo -n "Enter Dest IP/dns name: "
read ip

if [ -d $sdir ]
then
echo "backup started ...."
sleep 2
rsync -cavz $sdir docker@$ip:$ddir 1>Successful_backup.txt 2>errors_backup.txt
sleep 2
echo "Backup completed successfully"
else
echo please enter only folder name , $dir is the file
fi
