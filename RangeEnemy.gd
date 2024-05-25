extends CharacterBody2D

@onready var player = get_node("/root/World/Player")
var fireballScene = preload("res://EnemyFireball.tscn")

var onEscapeRange = false
var onSight = false
var health = 20
var attackTimer
var escapeTimer

func _ready():
	attackTimer = $AttackTimer
	escapeTimer = $EscapeTimer

func _physics_process(delta):
	if onEscapeRange or not escapeTimer.is_stopped():
		var direction = global_position.direction_to(player.global_position)
		velocity = -direction * 200.0
	else:
		velocity = Vector2(0.0,0.0)
	if onSight and attackTimer.is_stopped():
		shoot()
	move_and_slide()
	
func shoot():
	var fireball = fireballScene.instantiate()
	get_tree().current_scene.add_child(fireball)
	fireball.transform = self.transform
	fireball.shoot(player.global_position, self.global_position)
	attackTimer.start()

func _on_escape_range_area_entered(area):
	onEscapeRange = true

func _on_escape_range_area_exited(area):
	onEscapeRange = false

func _on_damage_zone_area_entered(area):
	health -= 5
	escapeTimer.start()
	if health <= 0:
		queue_free()

func _on_attack_range_area_entered(area):
	onSight = true

func _on_attack_range_area_exited(area):
	onSight = false
