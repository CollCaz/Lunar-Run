extends Node

var time := 0.0
var high_score := 0.0
var current_level
var save_path = "user://score.txt"
# Export var for the name of the last level
@export var last_level := "Level5"

func _process(delta):
	time += delta


func get_time() -> float:
	return time


func save_score():
	
	# load best time for comparison
	var previous_score = load_score()
	
	# prepare file writer
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	
	# check if no best time in file
	if previous_score == null:
		previous_score = 0.0
	
	
	if previous_score > time or previous_score == 0.0:
		high_score = time
		file.store_float(high_score)
	
	else:
		file.store_float(previous_score)
	
	file.close()

func load_score():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		high_score = file.get_float()
		file.close()

	else:
		print("file not found")
	
	
	return int(high_score)

