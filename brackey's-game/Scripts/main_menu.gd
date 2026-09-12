extends Control

@export var start_button: ButtonSFX
@export var settings_button: ButtonSFX
@export var credits_button: ButtonSFX
@export var exit_button: ButtonSFX

@onready var settings_overlay: Control = $Settings
@onready var credits_overlay: Control = $Credits


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_button.pressed.connect(_on_start_button_pressed)
	settings_button.pressed.connect(_on_settings_button_pressed)
	credits_button.pressed.connect(_on_credits_button_pressed)
	exit_button.pressed.connect(_on_exit_button_pressed)
	

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/BaseGameScenes/MainGame.tscn")
	
func _on_settings_button_pressed() -> void:
	settings_overlay.visible = not settings_overlay.visible

func _on_credits_button_pressed() -> void:
	credits_overlay.visible = not credits_overlay.visible

func _on_exit_button_pressed() -> void:
	get_tree().quit()
