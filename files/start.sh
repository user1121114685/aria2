#!/bin/sh
if [ ! -f /config/aria2.conf ]; then
	cp /config-copy/aria2.conf /config/aria2.conf
	if [ $SECRET ]; then
		echo "rpc-secret=${SECRET}" >> /config/aria2.conf
	fi
fi
if [ ! -f /config/on-complete.sh ]; then
	cp /config-copy/on-complete.sh /config/on-complete.sh
fi
if [ ! -f /config/dht.dat ]; then
        cp /config-copy/dht.dat /config/dht.dat
fi
if [ ! -f /config/aria2.session ]; then
	touch /config/aria2.session
fi

chmod +x /config/on-complete.sh

darkhttpd /AriaNg --port 80 &
darkhttpd /data --port 8080 &
aria2c --conf-path=/config/aria2.conf