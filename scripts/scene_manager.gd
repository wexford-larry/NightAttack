extends Node

@export var scene_animation: AnimationPlayer

func switch_animation(new_scene_path: String):
	scene_animation.play("from_normal_to_black")
	await get_tree().create_timer(0.5).timeout
	switch_scene(new_scene_path)
	scene_animation.queue("from_black_to_normal")


func switch_scene(new_scene_path):
	get_tree().change_scene_to_file(new_scene_path)
	
