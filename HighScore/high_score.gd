extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	var time = str(StopWatch.load_score())
	text = "Best Time: " + time.get_slice(".", 0) + "." + time.get_slice(".", 1).left(2)
