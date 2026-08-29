extends Control

@export var close_button: Button

@onready var credits: Control = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	close_button.pressed.connect(_on_close_button_pressed)

func _on_close_button_pressed() -> void:
	credits.visible = not credits.visible
