#!/bin/sh
#### "***********************************************"
#### "*       ..:: Script by MOHAMED_OS ::..        *"
#### "*  Support: https://github.com/MOHAMED19OS    *"
#### "*       E-Mail: mohamed19eng@gmail.com        *"
#### "***********************************************"

CAMNAME="PowerCAM"
BINARY="powercam"
CAM="PowerCAM"
OSD="PowerCAM"

remove_tmp () {
	rm -rf /tmp/*.info* /tmp/*.tmp*
}

case "$1" in
start)

# Function to check internet connectivity
check_internet() {
  ping -c 1 powercam.me &> /dev/null
  return $?
}

# Wait until internet is available with timeout
echo "Checking internet connectivity..."
timeout_duration=120
timeout_start=$(date +%s)
while ! check_internet; do
current_time=$(date +%s)
elapsed_time=$((current_time - timeout_start))

if [ $elapsed_time -ge $timeout_duration ]; then
echo "Timeout reached. Internet is still not available."
exit 1
fi

echo "Internet is not available. Waiting..."
sleep 5
done

echo "Internet is available. Starting command..."

/etc/tuxbox/powercam/powercam -b -p 4096 -c /etc/tuxbox/powercam/

file="/tmp/expire_date.txt"
name=$(cat "$file")

IP=$(ip addr show eth0 | awk '/inet / {print $2}' | cut -d/ -f 1)
wget -O /dev/null -q "http://$IP/api/message?text=$name&type=2&timeout=10&_=1425677186730"
wget -O /dev/null -q "http:/$IP/web/message?text=$name&type=2&timeout=10"

IP0=$(ip addr show wlan0 | awk '/inet / {print $2}' | cut -d/ -f 1)
wget -O /dev/null -q "http://$IP0/api/message?text=$name&type=2&timeout=10&_=1425677186730"
wget -O /dev/null -q "http://$IP0/web/message?text=$name&type=2&timeout=10"

wget -O /dev/null -q "http://$IP/api/message?text=$name&type=2&timeout=10&_=1425677186730"
wget -O /dev/null -q "http://$IP0/api/message?text=$name&type=2&timeout=10&_=1425677186730"

	;;
stop)
	killall -9 powercam 2> /dev/null
	killall -9 oscam 2> /dev/null
	;;
restart|reload)
	$0 stop
	sleep 1
	$0 start
	;;
version)
	echo "1.0.1"
	;;
info)
	echo "powercam"
	;;
*)
	echo "Usage: $0 start|stop|restart"
	exit 1
	;;
esac
exit 0
