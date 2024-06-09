extends FSMState

@export var Idle: FSMState
@export var Jump: FSMState

func enter(_Actor: AnimatedSprite2D):
	pass
	

func exit(Actor: AnimatedSprite2D):
	Actor.stop()

func physics_process(_delta, Actor: AnimatedSprite2D):
	var direction = Input.get_axis("left", "right")
	
	if direction:
		ActorController.velocity.x = direction * SPEED
	else:
		ActorController.velocity.x = move_toward(ActorController.velocity.x, 0, SPEED)
	
	if direction == 1 or direction == -1:
		Actor.play("Run")
	else:
		# Change state back to idle if there's no direction input
		fsm_machine.change_state(Idle)
	

	if Input.is_action_just_pressed("jump"):
		fsm_machine.change_state(Jump)

