#!/bin/bash

# This script is used by Nagios to post alerts into a Slack channel
# using the Incoming WebHooks integration. Create the channel, botname
# and integration first and then add this notification script in your
# Nagios configuration.


#Modify these variables for your environment
#Your Slack Channel Name
SLACK_CHANNEL="#nagios-alerts"  
WEBHOOK="Enter your webhook URL here"

#Get Service Status
NAGIOS_SERVICESTATE=${3}

#Set the message icon based on Nagios service state
if [ "$NAGIOS_SERVICESTATE" = "CRITICAL" ]
then
    ICON=":exclamation:"
elif [ "$NAGIOS_SERVICESTATE" = "WARNING" ]
then
    ICON=":warning:"
elif [ "$NAGIOS_SERVICESTATE" = "OK" ]
then
    ICON=":white_check_mark:"
elif [ "$NAGIOS_SERVICESTATE" = "UNKNOWN" ]
then
    ICON=":question:"
else
    ICON=":white_medium_square:"
fi

#Send message to Slack

curl -X POST --data-urlencode "payload={\"channel\": \"${SLACK_CHANNEL}\", \"username\": \"${SLACK_BOTNAME}\", \"text\": \"${ICON} HOST: ${1} SERVICE: ${2} MESSAGE: ${4} \"}" $WEBHOOK

