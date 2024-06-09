extends Node


var Bjørnar_Health = 10
var interacted_with_wanderer = false
var start_wanderer_dialogue = false


func _process(_delta):
	if start_wanderer_dialogue && Input.is_action_just_pressed("interact"):
		Dialogue.start()