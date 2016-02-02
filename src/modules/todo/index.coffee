m = require "mithril"

TodoViewModel = require "./TodoViewModel.coffee"
TodoController = require "./TodoController.coffee"
TodoView = require "./TodoView.coffee"

vm = new TodoViewModel()

m.mount document,
	controller: TodoController vm
	view: TodoView vm
