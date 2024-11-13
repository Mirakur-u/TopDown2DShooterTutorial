extends Area2D

class_name AmmoPickup


func _on_body_entered(body: Node2D) -> void:
	get_tree().get_first_node_in_group("pickup_player").play()
	(body as Player).on_ammo_pickup()
	queue_free()
