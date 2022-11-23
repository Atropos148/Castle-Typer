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


func _on_button_play_focus_entered() -> void:
	$SoundEffects.play()


func _on_button_credits_focus_entered() -> void:
	$SoundEffects.play()


func _on_button_quit_focus_entered() -> void:
	$SoundEffects.play()


func _on_music_volume_slider_focus_entered() -> void:
	$SoundEffects.play()


func _on_sounds_volume_slider_focus_entered() -> void:
	$SoundEffects.play()


func _on_music_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1, value)


func _on_sounds_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(2, value)


func _on_check_button_focus_entered() -> void:
	$SoundEffects.play()


func _on_check_button_toggled(button_pressed: bool) -> void:
	AudioServer.set_bus_mute(1, !button_pressed)
