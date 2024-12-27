extends CharacterBody2D

var can_move = true
var health = Global.meteor_health
var speed = Global.meteor_speed

var rng = RandomNumberGenerator.new()

func _physics_process(_delta):
	if can_move:
		var direction = global_position.direction_to(Vector2(320,180))
		velocity = direction * speed 
		move_and_slide()

func take_damage():
	health -= 1
	if health <= 0:
		await play_exploded()

func play_exploded():
	can_move = false
	%CollisionShape2D.position.x = 2000
	%CollisionShape2D.position.y = 2000
	#set_collision_mask_value(4, true)
	#Global._wave_counter()
	Global.scrap_count += rng.randi_range(1,3)
	$AnimatedSprite2d.animation = "explode"
	await $AnimatedSprite2d.animation_finished
	queue_free()
	return true

