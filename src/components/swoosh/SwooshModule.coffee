Module = require "../../Module.coffee"

module.exports = new Module()
	.view "SwooshView", require "./SwooshView.coffee"
	.init()
