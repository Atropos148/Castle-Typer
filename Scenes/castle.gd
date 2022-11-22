extends Node2D

@export var last_character_label: Label
@export var castle: Area2D

@export_range(60, 120, 1.0, "suffix:speed") var words_move_speed = 80.0

@export_group("Path Follows", "path_follow_")
@export var path_follow_top_enter: PathFollow2D
@export var path_follow_bottom_enter: PathFollow2D
@export var path_follow_left_enter: PathFollow2D
@export var path_follow_right_enter: PathFollow2D

@export_group("Words", "word_")
@export var word_1: CharacterBody2D
@export var word_2: CharacterBody2D
@export var word_3: CharacterBody2D
@export var word_4: CharacterBody2D

@onready var words: Array = [word_1, word_2, word_3, word_4]

var completed_words: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Camera2D/GameOverPanel.hide()
	for word in words:
		word.completed_word.connect(reset_word)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	path_follow_top_enter.progress += words_move_speed * delta
	path_follow_bottom_enter.progress += words_move_speed * delta
	path_follow_left_enter.progress += words_move_speed * delta
	path_follow_right_enter.progress += words_move_speed * delta

func _unhandled_key_input(event: InputEvent) -> void:
	if event.pressed == false:
		var letter = OS.get_keycode_string(event.keycode)
		last_character_label.text = letter
		get_tree().call_group("word", "check_pressed_letter", letter)

func _on_castle_area_body_entered(body: Node2D) -> void:
	if body.has_method("set_assigned_word"):
		$Camera2D/GameOverPanel.set_word_count_label(completed_words)
		$Camera2D/GameOverPanel.show()
		$Camera2D/GameOverPanel.focus_button()

func reset_word(word_to_reset: CharacterBody2D):
	completed_words += 1
	if completed_words % 5 == 0:
		words_move_speed += 5

	match word_to_reset.location:
		0: path_follow_top_enter.progress = 0
		1: path_follow_bottom_enter.progress = 0
		2: path_follow_left_enter.progress = 0
		3: path_follow_right_enter.progress = 0


func _on_game_over_panel_restart_round() -> void:
	get_tree().reload_current_scene()
