extends Area2D

@export var weapons: Array[PackedScene]

var current_gun = Global.max_gun
var health = Global.planet_health

func _ready():
	equip_gun()

func _on_body_entered(body):
	take_damage()
	var exploded : bool = false
	if body.has_method("play_exploded"):
		exploded = await body.play_exploded()
	if exploded:
		body.queue_free()

func take_damage():
	health -= 10
	%HealthBar.value = health
	if health <= 0:
		planet_dead()
	
func planet_dead():
	$AnimatedSprite2D.scale *= 2
	get_tree().paused = true
	$AnimatedSprite2D.play("dead")
	await $AnimatedSprite2D.animation_finished
	get_tree().change_scene_to_file("res://scenes/game_over_menu/game_over.tscn")
	
func upgrade_health():
	health += 10

func equip_gun():
	if len(weapons) == 0:
		return
	
	if self.find_child("Revolver") and current_gun == 1:
		self.get_child(-1).queue_free()
		
	if self.find_child("AK47") and current_gun == 2:
		self.get_child(-1).queue_free()
		
	var new_weapon := weapons[current_gun] as PackedScene
	var weapon_inst = new_weapon.instantiate()
	self.call_deferred("add_child", weapon_inst)
