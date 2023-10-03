extends CanvasLayer


func _input(_event):
	if Input.is_action_just_pressed("Escape"):
		if visible:
			get_tree().paused = false
			hide()
		else:
			show()
			get_tree().paused = true


func _on_resume_button_pressed():
	get_tree().paused = false
	self.hide()


func _on_exit_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Globals/MainMenu/MainMenu.tscn")


