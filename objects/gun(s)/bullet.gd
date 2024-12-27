extends Area2D

var direction = Vector2.ZERO
var travelled_distance = 0

func _physics_process(delta):
	$AnimatedSprite2D.play("fired")
	var speed = Global.bullet_speed
	const RANGE = 1920 
	
	position += direction * speed * delta
	travelled_distance += speed * delta
	
	if travelled_distance > RANGE:
		queue_free()

func _on_body_entered(body):
	queue_free()
	Global._wave_counter()
	if body.has_method("play_exploded"):
		await body.play_exploded()
	
