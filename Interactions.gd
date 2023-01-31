var red = "#FF0000"
var blue = "#00FF00"
var green = "#0000FF"
var purple = "#AA00FF"

export(Array) var colors = [red, blue, green, purple]

export(Dictionary) var iTable = {
	red: {
		red: -1,
		green: -1,
		blue: -1,
		purple: -1,
	},
	green: {
		red: 0.5,
		green: 0.5,
		blue: 0.5,
		purple: 0,
	},
	blue: {
		red: 0.5,
		green: -1,
		blue: 1,
		purple: 0.5,
	},
	purple: {
		red: 0.5,
		green: -1,
		blue: 0,
		purple: 1,
	},
}

func getRandIntDict():
	var dict = {}
	for color1 in colors:
		dict[color1] = {}
		for color2 in colors:
			dict[color1][color2] = randf() + randf() - 1.0
	return dict
