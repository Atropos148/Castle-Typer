extends Node2D


@export var last_character_label: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_class("InputEventKey"):
		var letter = OS.get_keycode_string(event.keycode)
		print(letter)
		last_character_label.text = letter
