extends CharacterBody2D

# @export makes the thing appear on the inspector to the right for easy changing.
@export var speed : int = 400

# Called when the node ENTERS the scene tree for the FIRST TIME.
func _ready():
	# Start the ball in a random direction towards up or down
	velocity.x = [-0.8,0.8].pick_random() # Horizontal velocity
	velocity.y = [-1,1].pick_random() # Vertical velocity
	
	#Normalise the vector so that diagonal doesn't give more value than unit directions.
	velocity = velocity.normalized() * speed

# Called EVERY FRAME. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# move_and_collide moves the ball and returns data IF a hit happens
	var collision = move_and_collide(velocity * delta) # Move by the given first argument and return collision object data if any
	
	if collision:
		# Use the 'bounce' method on our velocity using the wall's normal
		velocity = velocity.bounce(collision.get_normal()) # Provide normal to bounce off of.
