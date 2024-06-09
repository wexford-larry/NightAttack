extends FSMState

@export var Run: FSMState
@export var Jump: FSMState

func enter(Actor: AnimatedSprite2D):
	Actor.play("Idle")
	

func exit(Actor: AnimatedSprite2D):
	Actor.stop()
	

func physics_process(_delta, _Actor: AnimatedSprite2D):
	var direction = Input.get_axis("left", "right")


	# Change state to run if there's a direction input
	if direction:
		fsm_machine.change_state(Run)
		


	if Input.is_action_just_pressed("jump"):
	# Change state to jump if there's a jump input
		fsm_machine.change_state(Jump)
	
