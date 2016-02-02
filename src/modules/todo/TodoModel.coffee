"use strict"

m = require "mithril"

class TodoModel
	constructor: (@data) ->
		@description = m.prop @data.description
		@done = m.prop false

module.exports = TodoModel
