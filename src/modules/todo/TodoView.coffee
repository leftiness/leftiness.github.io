"use strict"

m = require "mithril"
infect = require "infect"

class Klass
	constructor: (vm, $NavigationModule) ->
		return ->
			m "div",
				m.component $NavigationModule
				m "article.card.row.two-third",
					m "header",
						m "h2", "Todo"
					m "div.content",
						m "input",
							onchange: m.withAttr "value", vm.description
							value: vm.description()
						m "button.row", onclick: vm.add, "Add"
						m "div",
							vm.list.map (task, index) ->
								decor = if task.done() then "line-through" else "none"
								style = style: textDecoration: decor
								return m "div.row.one",
									m "label",
										m "input[type=checkbox]",
											onclick: m.withAttr "checked", task.done
											checked: task.done()
										m "span.checkable", style, task.description()

TodoView = infect.func Klass

TodoView.$infect = [ "NavigationModule" ]

module.exports = TodoView
