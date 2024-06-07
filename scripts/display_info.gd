extends Control

@export var progress_bar: ProgressBar
@export var coin_display: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	progress_bar.value = GameManager.Bjørnar_Health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
