extends Control

@export var start: Button
@export var settings: Button
@export var exit: Button

@export var main_game: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start.pressed.connect(_on_start_button_pressed)
	settings.pressed.connect(_on_settings_button_pressed)
	exit.pressed.connect(_on_exit_button_pressed)
	

func _on_start_button_pressed() -> void:
	pass
	
func _on_settings_button_pressed() -> void:
	pass


func _on_exit_button_pressed() -> void:
	get_tree().quit()
