"use strict"

m = require "mithril"
infect = require "infect"

class Klass
	constructor: (vm, Trans, Swoosh) ->
		return ->
			m "div",
				Swoosh.createAll().map (each) ->
					m "div", style: each, config: Trans.swoosh()

SwooshView = infect.func Klass

SwooshView.$infect = [ "TransitionFactory", "SwooshStyleFactory" ]

module.exports = SwooshView
