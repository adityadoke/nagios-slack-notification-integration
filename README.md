# Nagios-Slack-Notification-Integration

Download slack_nagios.sh file from Git Repository and copy it to your nagios lib directory .
```
cp slack.sh /usr/local/nagios/libexec/slack_nagios.sh
```

Modify these variables for your environment
```
#Your Slack Channel Name
SLACK_CHANNEL="#nagios-alerts"  
WEBHOOK="Enter your webhook URL here"
``

Define Nagios command config lines for host and service notification as shown to commands.cfg file

```
#slack command
define command {
      command_name     notify-service-by-slack
      command_line /usr/local/nagios/libexec/slack_nagios.sh \
"$HOSTNAME$" \
"$SERVICEDESC$" \
"$SERVICESTATE$" \
"$SERVICEOUTPUT$" \
"$NOTIFICATIONTYPE$"
}

define command {
      command_name     notify-host-by-slack
      command_line /usr/local/nagios/libexec/slack_nagios.sh \
"$HOSTNAME$" \
"$SERVICEDESC$" \
"$SERVICESTATE$" \
"$SERVICEOUTPUT$" \
"$NOTIFICATIONTYPE$"
}

```


Define slack contact and add it in contact group members as shown in contacts.cfg file

```
#Slack Contact
define contact {
      contact_name                             slack
      alias                                    Slack
      service_notification_period              24x7
      host_notification_period                 24x7
      service_notification_options             w,u,c,r
      host_notification_options                d,r
      service_notification_commands            notify-service-by-slack
      host_notification_commands               notify-host-by-slack
}

define contactgroup{
        contactgroup_name       admins
        alias                   Nagios Administrators
        members                 nagiosadmin,slack
        }


```

Restart Nagios.

```shell
service nagios restart
```


