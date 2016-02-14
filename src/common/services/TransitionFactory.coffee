m = require "mithril"

doTransition = (element, klass, fn) ->
	events =
		"animation": "animationend"
		"webkitAnimation": "webkitAnimationEnd"
		"mozAnimation": "animationend"
		"msAnimation": "msAnimationEnd"
		"oanimation": "oanimationEnd"
	for own key, value of events
		if element.style[key] is undefined then continue
		element.classList.add klass
		handler = (event) ->
			event.target.removeEventListener event.type, handler
			fn()
			return
		element.addEventListener value, handler
		break
	return

class Klass
	intro: => return (element, isInitialized, context) ->
		if isInitialized then return
		doTransition element, "intro", -> element.classList.remove "intro"
	outro: => return (element, isInitialized, context) ->
		if isInitialized then return
		element.onclick = (e) ->
			e.preventDefault()
			el = document.getElementById "transition"
			doTransition el, "outro", -> m.route element.getAttribute "href"

module.exports = new Klass()
