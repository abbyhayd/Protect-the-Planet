extends Node2D

func _on_restart_button_down():
	get_tree().paused = false
	Global.reset()
	get_tree().change_scene_to_file("res://scenes/level/level.tscn")

func _on_quit_button_down():
	get_tree().paused = false
	get_tree().quit()
