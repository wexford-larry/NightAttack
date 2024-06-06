class_name FSM extends Node

@export var Actor: AnimatedSprite2D
@export var ActorController: CharacterBody2D
@export var initial_state: FSMState
var current_state: FSMState


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is FSMState:
			child.fsm_machine = self
	
	if is_instance_valid(initial_state):
		initial_state.enter(Actor, ActorController)
		current_state = initial_state
	

func _physics_process(delta):
	current_state.physics_process(delta, Actor, ActorController)


func change_state(new_state_name: FSMState):
	if is_instance_valid(current_state):
		current_state.exit(Actor)
		current_state = new_state_name
	
	new_state_name.enter(Actor, ActorController)
	
