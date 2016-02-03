infect = require "infect"

class Module
	view: (@viewName, @viewClass) =>
		infect.set @viewName, @viewClass
		name = !!@viewName
		klass = !!@viewClass
		if !name and !klass then return @view
		else if !name or !klass then throw new Error "Missing argument"
		else return this
	viewModel: (@viewModelName, @viewModelClass) =>
		infect.set @viewModelName, @viewModelClass
		name = !!@viewModelName
		klass = !!@viewModelClass
		if !name and !klass then return @viewModel
		else if !name or !klass then throw new Error "Missing argument"
		else return this
	init: =>
		@viewModel = new @viewModelClass()
		@view = new @viewClass @viewModel
		return this
	infect: (name, infectable) =>
		infect.set name, infectable
		return this

module.exports = Module
