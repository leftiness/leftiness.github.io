"use strict"

m = require "mithril"
infect = require "infect"

class Klass
	constructor: (vm, Trans) ->
		return ->
			opts =
				style:
					"width": "100%"
					"height": "100px"
					"background-color": "#7FDBFF"
					"position": "absolute"
					"top": "200px";
				config:
					Trans.swoosh()
			m "div", opts

SwooshView = infect.func Klass

SwooshView.$infect = [ "TransitionFactory" ]

module.exports = SwooshView
