extends CharacterBody2D

var speed = 350

func shoot(playerPosition, selfPosition):
	var vectorR = Vector2()
	vectorR = playerPosition - selfPosition
	scale = Vector2(3,3)
	velocity += speed * global_position.direction_to(playerPosition)
	rotation = atan2(vectorR[1],vectorR[0])

func _physics_process(delta):
	move_and_slide()

func _on_area_2d_area_entered(area):
	queue_free()
