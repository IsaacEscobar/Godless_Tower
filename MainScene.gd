extends Node

@onready var pause_menu = $PauseMen/PauseMenu

func _ready():
	pause_menu.hide()

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
