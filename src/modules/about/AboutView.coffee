"use strict"

m = require "mithril"

class AboutView
	constructor: (vm) ->
		return ->
			m "html",
				m "head",
					m "meta[name=viewport][content='width=device-width'][maximum-scale=1.0]"
					m "link[rel=stylesheet][href='dist/picnic.min.css']"
					m "link[rel=stylesheet][href='dist/plugins.min.css']"
					m "link[rel=stylesheet][href='dist/index.css']"
				m "body",
					m "article[class=card row two-third]",
						m "header",
							m "h2", "About"
						m "div", """Hello. Welcome to this great module. It is a very
						great module because it tells you all about the great demo. The
						great demo was created by Brandon. Thank you for reading this text.
						"""
						m "button", "Great!"

module.exports = AboutView
