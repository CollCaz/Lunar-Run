extends ProgressBar


@onready var OxyTimer := %OxyTimer

func _process(_delta):
	value = OxyTimer.time_left
