extends Control

@export_file("*.json") var dialogue_file
@export_file("*.json") var interacted_dialogue_file
@export var dialogue_rect: NinePatchRect
@export var dialogue_name: RichTextLabel
@export var dialogue_text: RichTextLabel

var next_dialogue: int = 0
var dialogue_content = []

func _ready():
	# Hide dialogue box on ready
	dialogue_rect.hide()



func _process(_delta):

	# Set global `GameManager` script to true at the end of conversation with level one wanderer
	if next_dialogue == 7:
		GameManager.interacted_with_wanderer = true

	# Load other dialogues when accept button is pressed
	if Input.is_action_just_pressed("accept"):
		# Hide dialogue box if `next_dialogue` variable is greater than or equals to the length of `dialogue_content` file
		if next_dialogue >= len(dialogue_content) -1:
			dialogue_rect.hide()
		else:
			inc_dialogue()



func start():
	dialogue_content = load_dialogue()
	dialogue_rect.show()

	# Updating UI displayed text based on the returned dialogue json file
	if GameManager.interacted_with_wanderer:
		dialogue_name.text = dialogue_content[0]["name"]
		dialogue_text.text = dialogue_content[0]["text"]
	else:
		dialogue_name.text = dialogue_content[next_dialogue]["name"]
		dialogue_text.text = dialogue_content[next_dialogue]["text"]


# Load dialogues from a json file
func load_dialogue():
	var dialogue = FileAccess.open(dialogue_file, FileAccess.READ)
	var interacted_dialogue = FileAccess.open(interacted_dialogue_file, FileAccess.READ)

	# Returning dialogue json file based on if global `GameManager` script is true at the end of conversation
	if GameManager.interacted_with_wanderer:
		return JSON.parse_string(interacted_dialogue.get_as_text())
	else:
		return JSON.parse_string(dialogue.get_as_text())





func inc_dialogue():
	next_dialogue += 1

	dialogue_name.text = dialogue_content[next_dialogue]["name"]
	dialogue_text.text = dialogue_content[next_dialogue]["text"]
