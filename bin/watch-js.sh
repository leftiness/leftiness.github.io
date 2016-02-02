mkdir -p ./dist
touch ./dist/app.js
watchify ./src/app.coffee -o ./dist/app.js -v &
