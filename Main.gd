extends Node2D

var Particle = preload("res://Particle.gd")
var Interactions = preload("res://Interactions.gd").new()

var minSpacing = 10
var maxDistance = 250

var forceDamping = 0.1

var size
var screenMiddle = Vector2(200, 200)

func _ready():
	size = get_viewport().size
	
	spawn(125)
	
func spawn(number):
	randomize()
	var colors = Interactions.colors
	
	for color in colors:
		for i in range(number / len(colors)):
			var x = randi() % int(size.x) - int(size.x / 2)
			var y = randi() % int(size.x) - int(size.x / 2)
			
			var pos = Vector2(x, y)
			spawnParticle(pos, color)

func _input(event):
	if event.is_action_pressed('ui_focus_next'):
		Interactions.iTable = Interactions.getRandIntDict()

func _process(delta):
	calcStep()
	update()
	
func calcStep():
	# calc velocity to all other points
	var particles = $Particles.get_children()
	
	for p1 in particles:
		for p2 in particles:
			if p1 != p2:
				calcInteraction(p1, p2)
			if p1.position.distance_to(screenMiddle) > 500:
				p1.velocity = p1.position.direction_to(screenMiddle).normalized() * 2

func calcInteraction(p1, p2):
	var distance = p1.position.distance_to(p2.position)
	if distance < minSpacing:
		var force = (distance / minSpacing)
		var direction = p1.position.direction_to(p2.position)
		direction = direction * -1
		p1.velocity += direction * force
	elif distance < maxDistance:
		var iForce = p2pInteraction(p1, p2)
		var force = (1 - (distance / maxDistance)) * forceDamping
		var direction = p1.position.direction_to(p2.position)
		p1.velocity += direction * force * iForce
		
func p2pInteraction(p1, p2):
	return Interactions.iTable[p1.code][p2.code]
		
func _draw():
	var particles = $Particles.get_children()
	for p in particles:
		draw_circle(p.position, 5, p.color)

func spawnParticle(pos, color):
	var p = Particle.new()
	p.color = Color(color)
	p.code = color
	p.position = pos
	$Particles.add_child(p)
 
