"use strict"

m = require "mithril"

class NavigationView
	constructor: (vm) ->
		return ->
			m "nav", do ->
				return []
				.concat m "a[href='#'][class=brand]", "Demo"
				.concat m "input#bmenub.show[type=checkbox]"
				.concat m "label.pseudo.button.toggle.burger[for=bmenub]", "Menu"
				.concat m "div.menu", do ->
					return []
					.concat m "a.pseudo.button[href='/todo']", config: m.route, "Todo"
					.concat m "a.pseudo.button[href='/about']", config: m.route, "About"

module.exports = NavigationView
