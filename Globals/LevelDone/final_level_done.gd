extends Area2D




func _on_body_entered(body):
	if body.get_name() == "Spaceman":
		StopWatch.set_process(false)
		StopWatch.save_score()
		
		get_tree().change_scene_to_file("res://Globals/EndScene/EndScene.tscn")
	
