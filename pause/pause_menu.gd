extends Control

var is_paused: bool = false

func set_is_paused(value):
	get_tree().paused = true
	set_visible(true)
	pass

func _unhandled_input(event):
	if event.is_action_pressed("escape"):
		set_is_paused(!is_paused)
		
func _on_resume_pressed():
	get_tree().paused = false
	set_visible(false)
	pass
	
func _on_main_men_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://menu/menu.tscn")
	pass
