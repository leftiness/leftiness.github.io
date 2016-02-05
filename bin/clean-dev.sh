#!/bin/bash
IGNORE[0]='vendor*'
CONCAT=''

for each in "${IGNORE[@]}"
do
	CONCAT="$CONCAT ! -iname $each"
done

find ./dist/* $CONCAT | xargs rm -rf
