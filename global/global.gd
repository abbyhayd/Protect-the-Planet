extends Node

#wave information
var current_wave = 1
var meteors_exploded = 0
var meteor_max = 10

#meteor information
var meteor_health = 1
var meteor_speed = 85

#player info
var max_health = 100
var planet_health = 100
var scrap_count = 0
var bullet_speed = 150
var max_gun = 0

#upgrade costs
var health_cost = 20
var bullet_speed_cost = 25
var gun_cost = 200

#---------------------------------------------------------------------

func _wave_counter():
	meteors_exploded += 1
	if meteors_exploded == meteor_max:
		current_wave += 1
		next_wave()
		
func reset():
	current_wave = 1
	meteors_exploded = 0
	meteor_max = 10
	
	meteor_health = 1
	meteor_speed = 75
	
	max_health = 100
	planet_health = 100
	scrap_count = 0
	bullet_speed = 200
	max_gun = 0
	
	health_cost = 20
	bullet_speed_cost = 25
	gun_cost = 200

func next_wave():
	planet_health = max_health
	meteors_exploded = 0
	meteor_max += 10
	inc_difficulty()
	get_tree().change_scene_to_file("res://scenes/upgrade_menu/upgrade_menu.tscn")

func inc_difficulty():
	meteor_health += 0.25
	meteor_speed += 5
