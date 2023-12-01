#!/bin/bash
todayDatetext=$(date '+%B %d %Y')
todayDate=$(date "+%Y-%m-%d %H:%M:%S")

diskused=$(df -h | grep "/dev/mapper/ubuntu--vg-ubuntu--lv" | awk '{print $5}')
disktext="Disk Used: $diskused"

fileUrl=/home/zabbix/zabbix.sql

#fileDate=$(date -r "$fileUrl" "+%Y-%m-%d %H:%M:%S")
#display the last modification time of file
fileSize=$(ls -lh "$fileUrl")

nameDevice="Zabbix Ubuntu"

statusText="Unknow"
sizeText="File size"
##################################################################################
url=https://hooks.slack.com/services/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

#############################################################
# gui bao cao
curl -X POST -H 'Content-type: application/json' --data '{"text":"'"<@U05FZDAEZ3M>"' \n '"$todayDate"' \n '"$disktext"' \n '"$sizeText"': '"$fileSize"' "}' $url
#############################################################