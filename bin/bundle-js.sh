#!/bin/bash
mkdir -p ./dist
touch ./dist/app.js
browserify ./src/app.coffee -o ./dist/app.js $CONCAT
