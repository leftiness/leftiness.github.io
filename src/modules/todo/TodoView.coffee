"use strict"

m = require "mithril"

module.exports = TodoView = (vm) -> return ->
	m "html",
		m "head",
			m "meta[name=viewport][content='width=device-width'][maximum-scale=1.0]"
			m "link[rel=stylesheet][href='dist/picnic.min.css']"
			m "link[rel=stylesheet][href='dist/plugins.min.css']"
			m "link[rel=stylesheet][href='dist/index.css']"
		m "body",
			m "article[class=card row two-third]",
				m "header",
					m "h2", "Todo"
				m "input",
					onchange: m.withAttr "value", vm.description
					value: vm.description()
				m "button", onclick: vm.add, "Add"
				m "div",
					vm.list.map (task, index) ->
						checkboxStyle =
							style:
								textDecoration: if task.done() then "line-through" else "none"
						return m "div[class=row one]",
							m "label",
								m "input[type=checkbox]",
									onclick: m.withAttr "checked", task.done
									checked: task.done()
								m "span[class=checkable]", checkboxStyle, task.description()
