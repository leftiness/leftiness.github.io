infect = require "infect"

class Module
	view: (@viewName, @viewClass) =>
		if !!@viewName and !!@viewClass
			infect.set @viewName, @viewClass
			return this
		else return @view
	viewModel: (@viewModelName, @viewModelClass) =>
		if !!@viewModelName and !!@viewModelClass
			infect.set @viewModelName, @viewModelClass
			return this
		else return @viewModel
	init: =>
		@viewModel = new @viewModelClass?()
		@view = new @viewClass @viewModel
		return this
	infect: (name, infectable) =>
		infect.set name, infectable
		return this

module.exports = Module
