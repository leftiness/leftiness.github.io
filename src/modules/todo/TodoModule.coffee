Module = require "../../Module.coffee"

module.exports = new Module()
	.viewModel "TodoViewModel", require "./TodoViewModel.coffee"
	.view "TodoView", require "./TodoView.coffee"
	.infect "TodoModel", require "./TodoModel.coffee"
	.infect "TodoListModel", require "./TodoListModel.coffee"
	.init()
