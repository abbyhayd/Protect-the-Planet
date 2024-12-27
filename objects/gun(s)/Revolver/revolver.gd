extends Area2D

func _physics_process(_delta):
	look_at(get_global_mouse_position())

func _input(event):
	if event.is_action_pressed("shoot_bullet"):
		shoot()
	
func shoot():
	const BULLET = preload("res://objects/gun(s)/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	%RevolverSprite.play("shooting")
	get_tree().get_root().add_child(new_bullet)
	new_bullet.direction = Vector2.RIGHT.rotated(rotation)
	new_bullet.global_rotation = %ShootPoint.global_rotation
	new_bullet.global_position = %ShootPoint.global_position

func remove_weapon():
	print("reached")
	get_parent().call_deferred("remove_child",self)
	queue_free()
