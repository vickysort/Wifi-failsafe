# Wifi-failsafe
This is a Wifi-failsafe. Whenever the primary Wifi fails, the host will be connected to the failsafe secondary Wifi

This Wifi-failsafe.sh has to be registered to the crontab.

chmod 777 /path/to/wifi-failsafe.sh # give all permissions to the script file <br/>
crontab -e # to register the cronjob <br/>
*/5 * * * * /path/to/wifi-failsafe.sh  # this will execute the script for every 5 minutes <br/>
crontab -l  # in order to verify that the cronjob is all set <br/>
