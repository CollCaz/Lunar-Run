extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.get_name() == "Spaceman":
		var timer = body.find_child("Oxy_timer")
		timer.paused = true
		timer.start(timer.wait_time)

	pass  # Replace with function body.


func _on_body_exited(body):
	if body.get_name() == "Spaceman":
		var timer = body.find_child("Oxy_timer")
		timer.paused = false

	pass  # Replace with function body.
