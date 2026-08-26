extends Control

@export var start_button: Button
@export var settings_button: Button
@export var exit_button: Button
@export var credits_button: Button

@export var main_game: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_button.pressed.connect(_on_start_button_pressed)
	settings_button.pressed.connect(_on_settings_button_pressed)
	credits_button.pressed.connect(_on_credits_button_pressed)
	exit_button.pressed.connect(_on_exit_button_pressed)
	

func _on_start_button_pressed() -> void:
	pass
	
func _on_settings_button_pressed() -> void:
	pass

func _on_credits_button_pressed() -> void:
	pass

func _on_exit_button_pressed() -> void:
	get_tree().quit()
