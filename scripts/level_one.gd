extends Node2D


@export var end_text: Label



func _on_area_2d_body_entered(body):
	if body.is_in_group("Protagonist"):
		var tween = get_tree().create_tween()
		tween.tween_property(end_text, "modulate:a", 1, 3.0)
