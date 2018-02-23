#!/bin/bash
url="`dirname $0`/splash/index.html"
vagrant up || exit 127
sleep 20
if [ ! -z `which xdg-open` ]; then
	xdg-open "$url"
elif [ ! -z `which open` ]; then
	open "$url"
fi
