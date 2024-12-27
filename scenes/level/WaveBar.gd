extends ProgressBar

func _process(_delta):
	value = Global.meteors_exploded
	max_value = Global.meteor_max
	
