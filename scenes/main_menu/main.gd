extends Node2D

func _on_play_button_down():
	get_tree().change_scene_to_file("res://scenes/level/level.tscn")

func _on_credits_button_down():
	get_tree().change_scene_to_file("res://scenes/credits_menu/credits.tscn")

func _on_quit_button_down():
	get_tree().quit()
