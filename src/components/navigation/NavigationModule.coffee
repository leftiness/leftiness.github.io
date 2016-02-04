Module = require "../../Module.coffee"

module.exports = new Module()
	.view "NavigationView", require "./NavigationView.coffee"
	.init()
