"use strict"

m = require "mithril"
infect = require "infect"

infect.set "Module", require "./Module.coffee"

m.route.mode = "search"

m.route document, "/todo",
  "/todo": require "./modules/todo/TodoModule.coffee"
  "/about": require "./modules/about/AboutModule.coffee"
