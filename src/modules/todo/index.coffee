m = require "mithril"

TodoViewModel = require "./TodoViewModel.coffee"
TodoView = require "./TodoView.coffee"

vm = new TodoViewModel()
view = new TodoView vm

m.mount document,	view: view.create
