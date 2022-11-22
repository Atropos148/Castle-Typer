extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var assigned_word: String

var next_letter_position: int = 0

@export var word_label: Label
@export var correct_letters_label: Label
@export_enum("Top", "Bottom", "Right", "Left") var location: int = 0

signal completed_word

func _ready() -> void:
	set_random_word()

func check_pressed_letter(pressed_letter: String):
	if assigned_word[next_letter_position] == pressed_letter.to_lower():
		correct_letters_label.text += assigned_word[next_letter_position]
		if next_letter_position + 1 < assigned_word.length():
			next_letter_position += 1
		else:
			emit_signal("completed_word", self)
			set_random_word()
			next_letter_position = 0
			correct_letters_label.text = ""

#	else:
#		print("wrong letter")
#		next_letter_position = 0
#		correct_letters_label.text = ""

func set_assigned_word(word: String):
	assigned_word = word
	word_label.text = assigned_word

func set_random_word():
	set_assigned_word(WordChooser.get_random_word())
