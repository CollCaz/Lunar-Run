extends Label


func _process(_delta):
	var time = str(StopWatch.get_time())
	text = time.get_slice(".", 0) + "." + time.get_slice(".", 1).left(1)
