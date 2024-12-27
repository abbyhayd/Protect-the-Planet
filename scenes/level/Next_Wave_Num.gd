extends Label

func _process(_delta):
	text = str(Global.meteors_exploded) + "/" + str(Global.meteor_max)
