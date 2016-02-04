"use strict"

m = require "mithril"

class NavigationView
	constructor: (vm) ->
		return ->
			m "nav",
				m "a[href='#'][class=brand]", "Demo"
				m "input[id=bmenub][type=checkbox][class=show]"
				m "label[for=bmenub][class=pseudo button toggle burger]", "Menu"
				m "div[class=menu]",
					m "a[href='/todo'][class=pseudo button]", config: m.route, "Todo"
					m "a[href='/about'][class=pseudo button]", config: m.route, "About"

module.exports = NavigationView
