extends CharacterBody2D

@export var Bjørnar: AnimatedSprite2D

func _ready():
	pass
	

func _physics_process(delta):
	var direction = Input.get_axis("left", "right")
	
	if velocity.x > 1:
		Bjørnar.flip_h = false
	elif velocity.x <  -1:
		Bjørnar.flip_h = true
	
	move_and_slide()
	
