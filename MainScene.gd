extends Node

@onready var pause_menu = $PauseMen/PauseMenu

var deathTimer

func _ready():
	pause_menu.hide()
	deathTimer = $GameOver/DeathTimer

func spawn_melee_enemy():
	var new_mob = preload("res://MeleeEnemy.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	while %PathFollow2D.global_position[0] > 900 or %PathFollow2D.global_position[0] < -900 or  %PathFollow2D.global_position[1] > 900 or %PathFollow2D.global_position[1] < -900:
		%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
func spawn_range_enemy():
	var new_mob = preload("res://RangeEnemy.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	while %PathFollow2D.global_position[0] > 900 or %PathFollow2D.global_position[0] < -900 or  %PathFollow2D.global_position[1] > 900 or %PathFollow2D.global_position[1] < -900:
		%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
var enemigos = 1
var ciclo = 0

func _on_timer_timeout():
	for i in range(enemigos):
		var x = randf()
		if x < 0.5:
			spawn_melee_enemy()
		else:
			spawn_range_enemy()
	ciclo += 1
	if ciclo == enemigos:
		if enemigos <= 10:
			enemigos += 1
		ciclo = 0
		


func _on_player_gameover():
	%GameOver.visible = true
	get_tree().paused = true
	$GameOver/PanelContainer/VBoxContainer/FinalScore.text = "Your Final Score: " + str(global_var.puntos) + " pts"


func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://menu/menu.tscn")
	pass
