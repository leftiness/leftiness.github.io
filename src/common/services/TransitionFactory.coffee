transition = require "mithril-transition"

class Klass
	create: (intro, outro) ->
		return transition
			anim: (lastEl, newEl, dir, cbLast, cbNew) ->
				events = [
					"webkitAnimationEnd"
					"mozAnimationEnd"
					"MSAnimationEnd"
					"oanimationend"
					"animationend"
				]
				events.map (event) ->
					lastEl.addEventListener event, handler = (e) ->
						e.target.removeEventListener e.type, handler
						cbLast()
						return
					newEl.addEventListener event, handler = (e) ->
						e.target.removeEventListener e.type, handler
						newEl.classList.remove intro
						cbNew()
						return
					return
				# TODO If dir isnt "next" then set different forward/backward animations
				lastEl.classList.add outro
				newEl.classList.add intro
				return

module.exports = new Klass()
