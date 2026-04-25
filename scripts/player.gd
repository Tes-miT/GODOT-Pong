extends StaticBody2D

const X_RIGHT_LIMIT : int = 263
const X_LEFT_LIMIT : int = -263

@export var SPEED : int = 300

func _physics_process(delta):
	var direction : int = Input.get_axis("ui_left", "ui_right")
	if direction > 0: # Right
		if position.x <= X_RIGHT_LIMIT:
			position.x += direction * SPEED * delta
		else:
			pass
			
	elif direction < 0: # Left
		if position.x >= X_LEFT_LIMIT:
			position.x += direction * SPEED * delta
		else:
			pass
