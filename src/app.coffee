"use strict"

m = require "mithril"
infect = require "infect"

infect.set name, comp for own name, comp of require "./common/index.coffee"
infect.set name, comp for own name, comp of require "./components/index.coffee"

m.route.mode = "search"

m.route document.body, "/todo",
  "/todo": require "./modules/todo/TodoModule.coffee"
  "/about": require "./modules/about/AboutModule.coffee"
