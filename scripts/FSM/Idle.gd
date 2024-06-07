extends FSMState

@export var Run: FSMState
@export var Jump: FSMState
@export var Attack: FSMState
@export var Shield: FSMState

func enter(Actor: AnimatedSprite2D, ActorController: CharacterBody2D):
	Actor.play("Idle")
	

func exit(Actor: AnimatedSprite2D):
	Actor.stop()
	

func physics_process(_delta, Actor: AnimatedSprite2D, ActorController: CharacterBody2D):
	var direction = Input.get_axis("left", "right")
	if direction:
		fsm_machine.change_state(Run)
		
	
	if Input.is_action_just_pressed("jump"):
		fsm_machine.change_state(Jump)
	
