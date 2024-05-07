extends CharacterBody2D

var speed = 500

func shoot(delta, player):
	var mouseDirection = (get_global_mouse_position() - player.global_position).normalized()
	velocity += speed * mouseDirection

func _physics_process(delta):
	$Area2D/Sprite2D.rotation += 0.2
	move_and_slide()

func _on_area_2d_area_entered(area):
	queue_free()
