extends Node2D



func _on_area_2d_body_entered(body):
	if GameManager.interacted_with_wanderer && body.is_in_group("Protagonist"):
		pass
