extends Node

@export var Wanderer: AnimatedSprite2D
@export var interact_label: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	Wanderer.play("Idle")



func _process(_delta):
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("Protagonist"):
		var tween = create_tween()
		tween.tween_property(interact_label, "modulate:a", 1, 0.5)
		GameManager.start_wanderer_dialogue = true



func _on_area_2d_body_exited(body):
	if body.is_in_group("Protagonist"):
		var tween = create_tween()
		tween.tween_property(interact_label, "modulate:a", 0, 0.5)
		GameManager.start_wanderer_dialogue = false
		Dialogue.dialogue_rect.hide()
