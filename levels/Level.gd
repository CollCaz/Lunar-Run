extends Node2D

@onready var player = get_parent().find_child("Spaceman")

func _ready():

	pass



func _on_next_level_zone_body_entered(body):
	if body == player:
		queue_free()
	pass # Replace with function body.
