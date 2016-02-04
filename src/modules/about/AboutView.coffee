"use strict"

m = require "mithril"
infect = require "infect"

class Klass
	constructor: (vm, $NavigationModule) ->
		return ->
			m "div",
				m $NavigationModule
				m "article[class=card row two-third]",
					m "header",
						m "h2", "About"
					m "div[class=content]", """
						Hello. Welcome to this great module. It is a very
						great module because it tells you all about the great demo. The
						great demo was created by Brandon. Thank you for reading this text.
					"""
					m "footer",
						m "button[class=row]", "Great!"


AboutView = infect.func Klass

AboutView.$infect = [ "NavigationModule" ]

module.exports = AboutView
