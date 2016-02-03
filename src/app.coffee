"use strict"

m = require "mithril"

todo = require "./modules/todo/TodoModule.coffee"

m.route.mode = "search"
m.route document, "/todo",
 "/todo": todo
