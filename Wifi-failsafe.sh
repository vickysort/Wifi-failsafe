PrimaryWifiSSID='primaryWifiSSID'
PrimaryWifiPassword='primaryWifiPassword'
FailsafeWifiSSID='failsafeWifiSSID'
FailsafeWifiPassword='failsafeWifiPassword'

getCurrentWifi(){
    echo "$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}')"
}

echo "Current Wifi: $(getCurrentWifi)"

if [ $(getCurrentWifi) == "$FailsafeWifiSSID" ]
then
        echo "Changing network to $PrimaryWifiSSID..."
        /usr/sbin/networksetup -setairportnetwork en0 $PrimaryWifiSSID $PrimaryWifiPassword
        sleep 6s
        if [ $(getCurrentWifi) == "$PrimaryWifiSSID" ]
        then
                echo "Wifi network change success"
                echo "Current Wifi: $(getCurrentWifi)"
                if curl -s --head  --request GET www.google.com | grep "200 OK" > /dev/null ;
                then
                        echo "Internet: Active";
                else
                        echo "Internet: Inactive. So reverting back to $FailsafeWifiSSID";
                        /usr/sbin/networksetup -setairportnetwork en0 $FailsafeWifiSSID $FailsafeWifiPassword
                fi
        else
                echo "$PrimaryWifiSSID is not active. So reverting back to $FailsafeWifiSSID"
                /usr/sbin/networksetup -setairportnetwork en0 $FailsafeWifiSSID $FailsafeWifiPassword
        fi
fi
