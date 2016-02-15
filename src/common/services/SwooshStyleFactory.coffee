deviation = (min, delta) ->
	max = min + delta
	return Math.random() * (max - min) + min

class Klass
	create: (color, yPos, width, height, delay) =>
		return style =
			"width": "#{width}%"
			"height": "#{height}px"
			"background-color": "#{color}"
			"position": "absolute"
			"top": "#{yPos}px"
			"-webkit-animation-delay": "#{delay}s"
			"animation-delay": "#{delay}s"
	createAll: =>
		yMin = 100
		yDelta = 200
		heightMin = 10
		heightDelta = 50
		widthMin = 100
		widthDelta = 75
		lines = 10
		delayMin = 0
		delayDelta = 0.4
		colors = [
			"#9BCBF6"
			"#5FACF2"
			"#2792F2"
			"#0280F0"
		]
		array = []
		for i in [0..lines]
			color = (deviation i, colors.length) % colors.length
			color = i % colors.length
			yPos = deviation yMin, yDelta
			width = deviation widthMin, widthDelta
			height = deviation heightMin, heightDelta
			delay = deviation delayMin, delayDelta
			array.push @create(colors[color], yPos, width, height, delay)
		return array

module.exports = new Klass()
