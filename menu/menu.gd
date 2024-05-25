class_name MainMenu
extends Control

@onready var button_start = $MarginContainer/HBoxContainer/VBoxContainer/Button_START as Button
@onready var button_exit = $MarginContainer/HBoxContainer/VBoxContainer/Button_EXIT as Button
@onready var start_level = preload("res://MainScene.tscn") as PackedScene

func _ready():
	button_start.button_down.connect(on_start_pressed)
	button_exit.button_down.connect(on_exit_pressed)

func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)
	
func on_exit_pressed() -> void:
	get_tree().quit()
