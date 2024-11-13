extends Area2D

class_name KeyPickup

func _on_body_entered(body: Node2D) -> void:
	get_tree().get_first_node_in_group("pickup_player").play()
	(body as Player).on_key_pickup()
	queue_free()
