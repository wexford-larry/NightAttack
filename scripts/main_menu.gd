extends Node2D

@export var initial_button: Button
@export var cloud_bg: ParallaxLayer
@export var control: Control
@onready var option_scene = preload("res://scenes/option_scene.tscn").instantiate()

func  _ready():
	initial_button.grab_focus()
	

func _process(delta):
	cloud_bg.motion_offset.x += -10 * delta
	
	if Input.is_action_just_pressed("go_back"):
		self.remove_child(option_scene)
		control.visible = true
		initial_button.grab_focus()
	

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://levels/level_one.tscn")


func _on_options_button_pressed():
	self.add_child(option_scene)
	control.visible = false
	


func _on_quit_button_pressed():
	get_tree().quit()
