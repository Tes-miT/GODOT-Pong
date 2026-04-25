extends Node

# @onready stores the values until the node is ready for being assigned
@onready var top_player_score_label = $CanvasLayer/TopPlayerScoreLabel
@onready var bottom_player_score_label = $CanvasLayer/BottomPlayerScoreLabel

# Global Score Storage variables
var top_player_score : int = 0
var bottom_player_score : int = 0

# Called when the node ENTERS the scene tree for the FIRST TIME.
func _ready():
	update_score_ui() # Call once at start of game to initialize labels to 0

# Function to update the labels on screen with current Global score variables.
func update_score_ui():
	top_player_score_label.text = str(top_player_score)
	bottom_player_score_label.text = str(bottom_player_score)

# Function to update score for each time the ball enters the top goal area
func _on_top_goal_body_entered(body) :
	if body.name == "Ball":
		bottom_player_score += 1
		update_score_ui()

# Function to update score for each time the ball enters the bottom goal area
func _on_bottom_goal_body_entered(body) :
	if body.name == "Ball":
		top_player_score += 1
		update_score_ui()
