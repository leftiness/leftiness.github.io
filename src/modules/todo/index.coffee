m = require "mithril"

TodoViewModel = require "./TodoViewModel.coffee"
TodoView = require "./TodoView.coffee"

vm = new TodoViewModel()

m.mount document,	view: TodoView vm
