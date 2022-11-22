extends Control

@export var credits_popup: PopupPanel
@export var play_button: Button
var castle_scene: PackedScene = load("res://Scenes/castle.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_button.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_play_pressed() -> void:
	get_tree().change_scene_to_packed(castle_scene)


func _on_button_credits_pressed() -> void:
	credits_popup.popup_centered()


func _on_button_quit_pressed() -> void:
	get_tree().quit()
