extends Area2D

func _physics_process(_delta):
	look_at(get_global_mouse_position())

func _input(event):
	if event.is_action_pressed("shoot_bullet"):
		for element in 3:
			%BurstDelay.start()
			await %BurstDelay.timeout
		%BurstDelay.stop()
	
func shoot():
	const BULLET = preload("res://objects/gun(s)/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	%AKSprite.play("shooting")
	get_tree().get_root().add_child(new_bullet)
	new_bullet.direction = Vector2.RIGHT.rotated(rotation)
	new_bullet.global_rotation = %ShootPoint.global_rotation
	new_bullet.global_position = %ShootPoint.global_position

func _on_burst_delay_timeout():
	shoot()
	
func remove_weapon():
	get_parent().call_deferred("remove_child",self)
	queue_free()
