"use strict"

m = require "mithril"

todo = require "./modules/todo/index.coffee"

m.route document.body, "/",
	"/": todo

# TODO Navigation and routing
# TODO Keep main layout. Place proper route partials inside of it.
# TODO electrolyte dependency injection
# TODO ba.js animation
# TODO Remove todo list. Lol.
