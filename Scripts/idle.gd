extends State

class_name IdleState

@onready var idle_timer: RandomTimer = $IdleTimer
@onready var rotation_timer: RandomTimer = $RotationTimer

var rotation_speed :float
var is_rotating = false
var rotation_degree: float = 0
var allow_rotation = true

func enter(msg = {}) -> void:
	(owner as Zombie).velocity = Vector2.ZERO
	rotation_speed = (owner as Zombie).rotation_speed
	idle_timer.setup()
	allow_rotation = true
	rotation_timer.setup()
	
func exit():
	is_rotating = false
	allow_rotation = false
	rotation_timer.stop()
	idle_timer.stop()

func physics_update(delta):
	if !is_rotating:
		return
	rotate_while_idle(delta)
	
	

func rotate_while_idle(delta:float):
	if is_rotating && allow_rotation:
		var rotation_angle = lerp_angle(deg_to_rad(owner.rotation_degrees), deg_to_rad(rotation_degree), delta * rotation_speed)
		owner.rotation = rotation_angle
	
	if absf(owner.rotation_degrees - rotation_degree) < 1.0:
		is_rotating = false
		rotation_timer.setup()
		



func _on_idle_timer_timeout() -> void:
	state_machine.transition_to("Wandering")
	


func _on_rotation_timer_timeout() -> void:
	try_rotating()
	

func try_rotating():
	if !allow_rotation or is_rotating:
		return
	
	start_rotating()

func start_rotating():
	rotation_degree = owner.rotation_degrees ++ randf_range(45, 300)
	is_rotating = true
	
