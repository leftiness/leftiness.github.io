#!/bin/bash
mkdir -p ./dist
lessc ./src/index.less ./dist/index.css
cp ./bower_components/picnic/releases/picnic.min.css ./dist
cp ./bower_components/picnic/releases/plugins.min.css ./dist
