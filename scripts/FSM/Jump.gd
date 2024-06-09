extends FSMState

@export var Idle: FSMState
@export var Run: FSMState


func enter(_Actor: AnimatedSprite2D):
	pass
	

func exit(Actor: AnimatedSprite2D):
	Actor.stop()
	

func physics_process(delta, Actor: AnimatedSprite2D):
	# Add the gravity.
	if !ActorController.is_on_floor():
		ActorController.velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and ActorController.is_on_floor():
		ActorController.velocity.y = JUMP_VELOCITY
		

	# Play Jump animation
	if ActorController.velocity.y < -1:
		Actor.play("JumpStart")
	elif ActorController.velocity.y > 1:
		Actor.play("JumpEnd")
	elif ActorController.velocity.y == 0:
		Actor.play("Idle")
	
	if ActorController.is_on_floor():
		# Change state to run if there's a direction input
		var direction = Input.get_axis("left", "right")

		if direction:
			fsm_machine.change_state(Run)
	

	
