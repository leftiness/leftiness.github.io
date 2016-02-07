"use strict"

m = require "mithril"
infect = require "infect"

components = require "./components/index.coffee"
commons = require "./common/index.coffee"

infect.set name, comp for own name, comp of components
infect.set name, comp for own name, comp of commons

m.route.mode = "search"

m.route document.body, "/todo",
  "/todo": require "./modules/todo/TodoModule.coffee"
  "/about": require "./modules/about/AboutModule.coffee"
