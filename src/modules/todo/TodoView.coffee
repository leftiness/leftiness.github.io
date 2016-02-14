"use strict"

m = require "mithril"
infect = require "infect"

class Klass
	constructor: (vm, Nav, Swoosh, Trans) -> return ->
		m "div", do ->
			return []
			.concat m.component Nav
			.concat m.component Swoosh
			.concat m "#transition", { key: m.route(), config: Trans.intro() },
				m "article.card.row.two-third", do ->
					return []
					.concat m "header",
						m "h2", "Todo"
					.concat m "div.content", do ->
						return []
						.concat m "input",
							onchange: m.withAttr "value", vm.description
							value: vm.description()
						.concat m "button.row", onclick: vm.add, "Add"
						.concat m "div", vm.list.map (task, index) ->
							decor = if task.done() then "line-through" else "none"
							style = style: textDecoration: decor
							return m "div.row.one",
								m "label", do ->
									return []
									.concat m "input[type=checkbox]",
										onclick: m.withAttr "checked", task.done
										checked: task.done()
									.concat m "span.checkable", style, task.description()

TodoView = infect.func Klass

TodoView.$infect = [ "NavigationModule", "SwooshModule", "TransitionFactory" ]

module.exports = TodoView
