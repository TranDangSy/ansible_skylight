#!/bin/bash
todayDatetext=$(date '+%B %d %Y')
todayDate=$(date "+%Y-%m-%d %H:%M:%S")

from_cisco=$(grep backup_cisco.yml /var/log/syslog)
from_cisco_text="Running backup from cisco device: $from_cisco"

to_nas=$(grep cisco_backup.sh /var/log/syslog)
to_nas_text="Running backup to nas device: $to_nas"

<@U05FZDAEZ3M>
##################################################################################
##pri-note
url=https://hooks.slack.com/services/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

#############################################################
# gui bao cao
curl -X POST -H 'Content-type: application/json' --data '{"text": "'"$todayDatetext"' \n '"$from_cisco_text"' \n '"$to_nas_text"'"}' $url
#############################################################