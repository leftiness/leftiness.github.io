#!/bin/bash
NODE='./node_modules/'
DEPS[0]='infect/infect.js'
DEPS[1]='mithril/mithril.js'
EXCLUDE=''

for each in "${DEPS[@]}"
do
	EXCLUDE="$EXCLUDE -x $NODE$each"
done

mkdir -p ./dist
touch ./dist/app.js
browserify $EXCLUDE ./src/app.coffee -o ./dist/app.js
