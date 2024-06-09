class_name FSMState extends Node


const SPEED = 80.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var fsm_machine: FSM
var ActorController: CharacterBody2D


func enter(_Actor: AnimatedSprite2D):
	pass
	

func exit(_Actor: AnimatedSprite2D):
	pass
	

func physics_process(_delta, _Actor: AnimatedSprite2D):
	pass
	
