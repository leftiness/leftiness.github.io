"use strict"

m = require "mithril"
infect = require "infect"

class Klass
	constructor: (@$TodoModel, @$TodoListModel) ->
		@list = new @$TodoListModel()
		@description = m.prop ""
	add: =>
		if @description()
			@list.push new @$TodoModel description: @description()
			@description ""

TodoViewModel = infect.func Klass

TodoViewModel.$infect = [ "TodoModel, TodoViewModel" ]

module.exports = TodoViewModel
