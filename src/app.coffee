"use strict"

m = require "mithril"

todo = require "./modules/todo/index.coffee"

m.route.mode = "search"
m.route document, "/todo",
 "/todo": todo
