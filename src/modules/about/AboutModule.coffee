Module = require "../../Module.coffee"

module.exports = new Module()
	.view "AboutView", require "./AboutView.coffee"
	.init()
