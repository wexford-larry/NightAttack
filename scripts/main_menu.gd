extends Node2D

@export var initial_button: Button
@export var cloud_bg: ParallaxLayer
@export var control: Control
@export var logo: ColorRect
@export var button_sound: AudioStreamPlayer2D
@export var switch_sound: AudioStreamPlayer2D
@onready var option_scene = preload("res://scenes/option_scene.tscn").instantiate()

func  _ready():
	initial_button.grab_focus()
	

func _process(delta):
	cloud_bg.motion_offset.x += -10 * delta
	
	if Input.is_action_just_pressed("go_back"):
		self.remove_child(option_scene)
		control.visible = true
		logo.visible = true
		initial_button.grab_focus()
	

func _input(event):
	if event.is_action_pressed("ui_up") or event.is_action_pressed("ui_down"):
		if option_scene.is_inside_tree():
			pass
		else:
			switch_sound.play()


func _on_start_button_pressed():
	button_sound.play()
	SceneManager.switch_animation("res://levels/level_one.tscn")
	


func _on_options_button_pressed():
	button_sound.play()
	self.add_child(option_scene)
	control.visible = false
	logo.visible = false
	


func _on_quit_button_pressed():
	get_tree().quit()
