extends Node

# These variables "find" your UI labels when the game starts
@onready var player_up_label = $CanvasLayer/PlayerUpLabel
@onready var player_bottom_label = $CanvasLayer/PlayerBottomLabel

var player_up : int = 0
var player_bottom : int = 0

func _ready():
	update_score_ui()

func _on_top_goal_body_entered(body) :
	if body.name == "Ball":
		player_bottom += 1
		update_score_ui()

func _on_bottom_goal_body_entered(body) :
	if body.name == "Ball":
		player_up += 1
		update_score_ui()

func update_score_ui():
	player_up_label.text = str(player_up)
	player_bottom_label.text = str(player_bottom)


func _on_area_bottom_body_entered(body):
	pass # Replace with function body.
