"use strict"

m = require "mithril"

TodoModel = require "./TodoModel.coffee"
TodoListModel = require "./TodoListModel.coffee"

class TodoViewModel
	constructor: ->
		@list = new TodoListModel()
		@description = m.prop ""
	add: =>
		if @description()
			@list.push new TodoModel description: @description()
			@description ""

module.exports = TodoViewModel
