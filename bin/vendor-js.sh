#!/bin/bash
NODE='./node_modules/'
DEPS[0]='infect/infect.js:infect'
DEPS[1]='mithril/mithril.js:mithril'
DEPS[2]='mithril.animate/dist/mithril.animate.js:mithril.animate'
VENDOR=''

for each in "${DEPS[@]}"
do
	VENDOR="$VENDOR -r $NODE$each"
done

mkdir -p ./dist
touch ./dist/vendor.js
browserify $VENDOR -o ./dist/vendor.js
