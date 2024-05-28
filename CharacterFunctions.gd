extends CharacterBody2D

var positionOFFSET: Vector2

const DAMAGE = 10

var axeScene = preload("res://PlayerAxe.tscn")
var move_speed = 300
var health = 100
var enemiesHitting = 0
var animation_player
var attackCD

signal gameover

func _ready():
	animation_player = $AnimationPlayer
	attackCD = $Timer

func get_movement_input():
	velocity.x = 0
	velocity.y = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var up = Input.is_action_pressed('ui_up')
	var down = Input.is_action_pressed('ui_down')
	
	if right:
		velocity.x += move_speed
		$Sprite.flip_h = true
		animation_player.play("Walking")
	if left:
		velocity.x -= move_speed
		$Sprite.flip_h = false
		animation_player.play("Walking")
	if up:
		velocity.y -= move_speed
		animation_player.play("Walking")
	if down:
		velocity.y += move_speed
		animation_player.play("Walking")
		
func shoot(delta):
	var axe = axeScene.instantiate()
	get_tree().current_scene.add_child(axe)
	axe.transform = self.transform
	axe.shoot(delta, self)
	attackCD.start()
	
func _physics_process(delta):
	health -= DAMAGE * enemiesHitting * delta
	%HealthBar.value = health
	if health <= 0:
		gameover.emit()
	get_movement_input()
	move_and_slide()
	if Input.is_action_pressed("shoot") and attackCD.is_stopped():
		shoot(delta)
	

func _on_area_2d_area_entered(area):
	enemiesHitting += 1

func _on_area_2d_area_exited(area):
	enemiesHitting -= 1
