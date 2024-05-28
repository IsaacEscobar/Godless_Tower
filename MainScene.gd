extends Node

@onready var pause_menu = $PauseMen/PauseMenu

var deathTimer

func _ready():
	pause_menu.hide()
	deathTimer = $GameOver/DeathTimer

func spawn_melee_enemy():
	var new_mob = preload("res://MeleeEnemy.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
func spawn_range_enemy():
	var new_mob = preload("res://RangeEnemy.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout():
	spawn_melee_enemy()
	spawn_range_enemy()


func _on_player_gameover():
	%GameOver.visible = true
	get_tree().paused = true
	$GameOver/PanelContainer/VBoxContainer/FinalScore.text = "Your Final Score: " + str(global_var.puntos) + " pts"


func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://menu/menu.tscn")
	pass
