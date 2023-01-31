extends Camera2D

var speed = 7.5

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		position += Vector2.UP * speed
	if Input.is_action_pressed("ui_down"):
		position += Vector2.DOWN * speed
	if Input.is_action_pressed("ui_right"):
		position += Vector2.RIGHT * speed
	if Input.is_action_pressed("ui_left"):
		position += Vector2.LEFT * speed

func _input(event):
	if event.is_action_released("mwd"):
		zoom += Vector2(0.1, 0.1)
	if event.is_action_released("mwu"):
		zoom += Vector2(-0.1, -0.1)
