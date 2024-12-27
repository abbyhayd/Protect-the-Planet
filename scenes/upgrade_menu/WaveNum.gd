extends Label

func _process(_delta):
	text = "Wave " + str(Global.current_wave - 1) + " Complete!"
