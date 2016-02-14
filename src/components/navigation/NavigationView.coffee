"use strict"

m = require "mithril"
infect = require "infect"

class Klass
	constructor: (vm, Trans) ->
		return ->
			m "nav", do ->
				return []
				.concat m "a[href='#'][class=brand]", "Demo"
				.concat m "input#bmenub.show[type=checkbox]"
				.concat m "label.pseudo.button.toggle.burger[for=bmenub]", "Menu"
				.concat m "div.menu", do ->
					return []
					.concat m "a.pseudo.button[href='/todo']", config: Trans.outro(), "Todo"
					.concat m "a.pseudo.button[href='/about']", config: Trans.outro(), "About"

NavigationView = infect.func Klass

NavigationView.$infect = [ "TransitionFactory" ]

module.exports = NavigationView
