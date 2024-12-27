extends Node2D

var break_time = false
var max_bullet_speed = false

func _process(_delta):
	if Global.bullet_speed == 1000:
		max_bullet_speed_reached()
	if Global.max_gun >= 2:
		max_gun_reached()
	if Global.max_gun > 0:
		%Gun_Icon.play("mp_idle")

func _on_continue_button_down():
	break_time = false
	get_tree().change_scene_to_file("res://scenes/level/level.tscn")

func _on_main_menu_button_down():
	Global.reset()
	break_time = false
	get_tree().change_scene_to_file("res://scenes/main_menu/main.tscn")
	
func _on_timer_timeout():
	break_time = true

func _on_health_upgrade_mouse_entered():
	%Health_Icon.play("spinning")
func _on_health_upgrade_mouse_exited():
	%Health_Icon.play("idle")

func _on_bullet_speed_upgrade_mouse_entered():
	%Bullet_Speed_Icon.play("explosion")
func _on_bullet_speed_upgrade_mouse_exited():
	%Bullet_Speed_Icon.play("idle")

func _on_gun_upgrade_mouse_entered():
	if Global.max_gun == 0:
		%Gun_Icon.play("ak_shooting")
	elif Global.max_gun >= 1:
		%Gun_Icon.play("mp_shooting")
		
func _on_gun_upgrade_mouse_exited():
	if Global.max_gun == 0:
		%Gun_Icon.play("ak_idle")
	elif Global.max_gun >= 1:
		%Gun_Icon.play("mp_idle")

func _on_health_upgrade_button_down():
	if break_time == true:
		if Global.health_cost <= Global.scrap_count:
			Global.max_health += 10
			Global.scrap_count -= Global.health_cost
			Global.health_cost += 15

func _on_bullet_speed_upgrade_button_down():
	if break_time == true:
		if Global.bullet_speed_cost <= Global.scrap_count and Global.bullet_speed != 1000:
			Global.bullet_speed += 25
			Global.scrap_count -= Global.bullet_speed_cost
			Global.bullet_speed_cost += 20

func _on_gun_uprade_button_down():
	if break_time == true:
		if Global.gun_cost <= Global.scrap_count and Global.max_gun <= 2:
			Global.max_gun += 1
			Global.scrap_count -= Global.gun_cost
			Global.gun_cost += 200

func max_bullet_speed_reached():
	%Bullet_Speed_Cost.text = "Max Bullet Speed!"

func max_gun_reached():
	%Gun_Cost.text = "Max Gun Reached!"
	
