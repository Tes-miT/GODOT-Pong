extends StaticBody2D

# CONSTANTS are denoted by capital letters and cannot be changed
const X_RIGHT_LIMIT : int = 263 
const X_LEFT_LIMIT : int = -263

# @export makes the thing appear on the inspector to the right for easy changing.
@export var SPEED : int = 300

# Called EVERY PHYSICS TICK.
func _physics_process(delta):
	var direction : int = Input.get_axis("Top_Player_Left", "Top_Player_Right") # Grab the direction in integer values (Left = -1 | Right = 1)

	if direction > 0: # RIGHT direction detected
		if position.x <= X_RIGHT_LIMIT: # Check if not hugging RIGHT world-bound
			position.x += direction * SPEED * delta
		else: # Skip RIGHT movement if hugging
			pass
			
	elif direction < 0: # LEFT direction detected
		if position.x >= X_LEFT_LIMIT: # Check if not hugging LEFT world-bound
			position.x += direction * SPEED * delta 
		else: # Skip LEFT movement if hugging
			pass
