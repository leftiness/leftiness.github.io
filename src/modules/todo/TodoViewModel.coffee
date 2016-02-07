"use strict"

m = require "mithril"
infect = require "infect"

class Klass
	constructor: (@Todo, @TodoList) ->
		@list = new @TodoList()
		@description = m.prop ""
	add: =>
		if @description()
			@list.push new @Todo description: @description()
			@description ""

TodoViewModel = infect.func Klass

TodoViewModel.$infect = [ "TodoModel", "TodoListModel" ]

module.exports = TodoViewModel
