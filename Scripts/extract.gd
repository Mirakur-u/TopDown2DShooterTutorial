extends Area2D

@onready var random_timer: RandomTimer = $RandomTimer

var player

func _process(delta: float) -> void:
	if !random_timer.is_stopped():
		player.update_extract_timer(random_timer.time_left)

func _on_body_entered(body: Node2D) -> void:
	if (body as Player).has_key:
		player = body
		random_timer.setup()


func _on_body_exited(body: Node2D) -> void:
	random_timer.stop()
	(body as Player).hide_extract_countdown()
	player = null


func _on_random_timer_timeout() -> void:
	random_timer.stop()
	player.extract()
