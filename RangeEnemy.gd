extends CharacterBody2D

@onready var player = get_node("/root/World/Player")

var onSight = false
var health = 20
var attackTimer

func _ready():
	attackTimer = $AttackTimer

#func _physics_process(delta):
	#if onSight or not attackTimer.is_stopped():
		#var direction = global_position.direction_to(player.global_position)
		#velocity = direction * 200.0
	#else:
		#velocity = Vector2(0.0,0.0)
	#move_and_slide()


func _on_attack_range_area_entered(area):
	onSight = true

func _on_attack_range_area_exited(area):
	onSight = false


func _on_damage_zone_area_entered(area):
	health -= 5
	attackTimer.start()
	if health <= 0:
		queue_free()
