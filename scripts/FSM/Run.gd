extends FSMState

@export var Idle: FSMState
const SPEED = 80.0

func enter(Actor: AnimatedSprite2D, _ActorController: CharacterBody2D):
	pass
	

func exit(Actor: AnimatedSprite2D):
	Actor.stop()
	

func physics_process(_delta, Actor: AnimatedSprite2D, ActorController: CharacterBody2D):
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction:
		ActorController.velocity.x = direction * SPEED
	else:
		ActorController.velocity.x = move_toward(ActorController.velocity.x, 0, SPEED)
	
	if direction == 1 or direction == -1:
		Actor.play("Run")
	else:
		fsm_machine.change_state(Idle)
	
