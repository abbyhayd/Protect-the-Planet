extends Label

func _process(_delta):
	if Global.max_gun >= 2:
		text = "Max Gun Reached!"
	else:
		text = str(Global.gun_cost) + " scraps"
