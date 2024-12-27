extends Label

func _process(_delta):
	if Global.bullet_speed == 1000:
		text = "Max Bullet Speed!"
	else:
		text = str(Global.bullet_speed_cost) + " scraps"
