extends CharacterBody2D

class_name Player

@export var speed = 300
@export var rotation_speed = 5
var movement_direction: Vector2 = Vector2.ZERO
var angle


func _physics_process(delta: float) -> void:
	movement_direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = movement_direction * speed
	angle = (get_global_mouse_position() - global_position).angle()
	move_and_slide()
	
	if angle:
		global_rotation = lerp_angle(global_rotation, angle, delta * rotation_speed)
