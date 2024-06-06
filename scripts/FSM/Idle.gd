extends FSMState

@export var Run: FSMState

func enter(Actor: AnimatedSprite2D, ActorController: CharacterBody2D):
	Actor.play("Idle")
	

func exit(Actor: AnimatedSprite2D):
	Actor.stop()
	

func physics_process(_delta, Actor: AnimatedSprite2D, ActorController: CharacterBody2D):
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction:
		fsm_machine.change_state(Run)
	
