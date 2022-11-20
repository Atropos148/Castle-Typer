extends Node2D


@export var last_character_label: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_key_input(event: InputEvent) -> void:
	if event.pressed == false:
		var letter = OS.get_keycode_string(event.keycode)
		last_character_label.text = letter
		get_tree().call_group("word", "check_pressed_letter", letter)

