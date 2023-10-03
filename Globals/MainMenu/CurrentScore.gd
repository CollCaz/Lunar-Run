extends Label



func _ready():
	var time = str(StopWatch.time)
	text = "Time: " + time.get_slice(".", 0) + "." + time.get_slice(".", 1).left(2)
