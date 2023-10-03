extends Area2D

signal done

@export var next_level : String

func _on_body_entered(body):
	if body.get_name() == "Spaceman":
		get_tree().change_scene_to_file(next_level)
		emit_signal("done")
