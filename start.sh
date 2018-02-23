#!/bin/bash
url="http://localhost:3000"
vagrant up || exit 127
sleep 20
if [ ! -z `which xdg-open` ]; then
	xdg-open "$url"
elif [ ! -z `which open` ]; then
	open "$url"
fi
