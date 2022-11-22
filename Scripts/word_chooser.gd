extends Node

@onready var words_file = "res://Scripts/words.txt"

@onready var words_list_en: PackedStringArray
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_file(words_file)
	randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_file(file_location) -> void:
	var file = FileAccess.open(file_location, FileAccess.READ)
	var content = file.get_as_text().split("\n")
	content.remove_at(997)
	words_list_en = content

func get_random_word() -> String:
	var number: int = randi() % words_list_en.size()
	return words_list_en[number]
