"use strict"

m = require "mithril"

class NavigationView
	constructor: (vm) ->
		return ->
			m "nav",
				m "a[href='#'][class=brand]", "Demo"
				m "input#bmenub.show[type=checkbox]"
				m "label.pseudo.button.toggle.burger[for=bmenub]", "Menu"
				m "div.menu",
					m "a.pseudo.button[href='/todo']", config: m.route, "Todo"
					m "a.pseudo.button[href='/about']", config: m.route, "About"

module.exports = NavigationView
