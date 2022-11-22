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
#			queue_free()
			emit_signal("completed_word", self)
			set_random_word()
			next_letter_position = 0
			correct_letters_label.text = ""

	else:
		print("wrong letter")
#		next_letter_position = 0
#		correct_letters_label.text = ""

func set_assigned_word(word: String):
	assigned_word = word
	word_label.text = assigned_word

func set_random_word():
	set_assigned_word(WordChooser.get_random_word())

#func _physics_process(delta: float) -> void:
#	# Add the gravity.
#	if not is_on_floor():
#		velocity.y += gravity * delta
#
#	# Handle Jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
#		velocity.y = JUMP_VELOCITY
#
#	# Get the input direction and handle the movement/deceleration.
#	# As good practice, you should replace UI actions with custom gameplay actions.
#	var direction := Input.get_axis("ui_left", "ui_right")
#	if direction:
#		velocity.x = direction * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)
#
#	move_and_slide()
