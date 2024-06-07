extends FSMState

const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func enter(_Actor: AnimatedSprite2D, _ActorController: CharacterBody2D):
	pass
	

func exit(Actor: AnimatedSprite2D):
	pass #Actor.stop()
	

func physics_process(delta, Actor: AnimatedSprite2D, ActorController: CharacterBody2D):
		# Add the gravity.
	if not ActorController.is_on_floor():
		ActorController.velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and ActorController.is_on_floor():
		ActorController.velocity.y = JUMP_VELOCITY
		
	
