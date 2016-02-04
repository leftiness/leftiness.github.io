"use strict"

m = require "mithril"
infect = require "infect"

class Klass
	constructor: (vm, $NavigationModule) ->
		return ->
			m "html",
				m "head",
					m "meta[name=viewport][content='width=device-width'][maximum-scale=1.0]"
					m "link[rel=stylesheet][href='dist/picnic.min.css']"
					m "link[rel=stylesheet][href='dist/plugins.min.css']"
					m "link[rel=stylesheet][href='dist/index.css']"
				m "body",
					m $NavigationModule
					m "article[class=card row two-third]",
						m "header",
							m "h2", "Todo"
						m "input",
							onchange: m.withAttr "value", vm.description
							value: vm.description()
						m "button", onclick: vm.add, "Add"
						m "div",
							vm.list.map (task, index) ->
								decor = if task.done() then "line-through" else "none"
								style = style: textDecoration: decor
								return m "div[class=row one]",
									m "label",
										m "input[type=checkbox]",
											onclick: m.withAttr "checked", task.done
											checked: task.done()
										m "span[class=checkable]", style, task.description()

TodoView = infect.func Klass

TodoView.$infect = [ "NavigationModule" ]

module.exports = TodoView
