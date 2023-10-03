extends Node2D

const MAX_OXY_TIME = 10

@onready var player = get_node("Spaceman")
@onready var oxy_time = player.find_child("OxyTimer")
@onready var oxy_level = get_node("OxyLevel")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
	if player != null:
		oxy_level.value = (oxy_time.time_left * 100) / MAX_OXY_TIME



func _on_spaceman_died():
	get_tree().reload_current_scene()
	print("died")
