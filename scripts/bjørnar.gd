extends CharacterBody2D

@export var Bjørnar: AnimatedSprite2D

func _ready():
	pass
	

func _physics_process(_delta):
	
	if velocity.x > 1:
		Bjørnar.flip_h = false
	elif velocity.x < -1:
		Bjørnar.flip_h = true
	
	move_and_slide()
	
