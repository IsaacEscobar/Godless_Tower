extends CanvasLayer

func _ready():
	get_tree().paused = true
	
func _on_resume_pressed():
	get_tree().paused = false
	queue_free()

func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://menu/menu.tscn")
	
func _on_restart_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://MainScene.tscn")
