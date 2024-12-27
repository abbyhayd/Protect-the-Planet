extends Node2D

func _ready():
	#print("\nplanet health = " + str(Global.planet_health))
	#print("bullet speed = " + str(Global.bullet_speed))
	#print("meteor health = " + str(Global.meteor_health))
	#print("meteor speed = " + str(Global.meteor_speed))
	
	if Global.current_wave >= 2:
		%Tutorial.hide()

func spawn_meteor():
	var new_meteor = preload("res://objects/meteor.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_meteor.global_position = %PathFollow2D.global_position
	add_child(new_meteor)

func _on_meteor_spawn_timer_timeout():
	spawn_meteor()

