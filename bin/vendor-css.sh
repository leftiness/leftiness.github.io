#!/bin/bash
NODE='./node_modules/'
DEPS[0]='picnic/releases/picnic.min.css'
DEPS[1]='picnic/releases/plugins.min.css'
VENDOR=''

for each in "${DEPS[@]}"
do
	VENDOR="$VENDOR $NODE$each"
done

mkdir -p ./dist
touch ./dist/vendor.css
cat $VENDOR > ./dist/vendor.css
