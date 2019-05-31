# Wifi-failsafe
This is a Wifi-failsafe. Whenever the primary Wifi fails, the host will be connected to the failsafe secondary Wifi

This Wifi-failsafe.sh has to be registered to the crontab.

chmod 777 /path/to/wifi-failsafe.sh # give all permissions to the script file
crontab -e # to register the cronjob
*/5 * * * * /path/to/wifi-failsafe.sh  # this will execute the script for every 5 minutes
crontab -l  # in order to verify that the cronjob is all set
