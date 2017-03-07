# Nagios-Slack-Notification-Integration

Nagios config lines that are added to commands.cfg

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
