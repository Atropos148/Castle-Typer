extends Control

signal restart_round

@export var count_label: Label
@export var button: Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	focus_button()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_word_count_label(count: int):
	count_label.text = "You typed " + str(count) + " words!"

func focus_button():
	button.grab_focus()

func _on_button_pressed() -> void:
	emit_signal("restart_round")

func _on_button_quit_pressed() -> void:
	var scene: PackedScene = load("res://Scenes/main_menu.tscn")
	get_tree().change_scene_to_packed(scene)


func _on_button_focus_entered() -> void:
	$SoundEffects.play()


func _on_button_quit_focus_entered() -> void:
	$SoundEffects.play()
