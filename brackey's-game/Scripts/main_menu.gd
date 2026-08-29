extends Control

@onready var start_button: Button = $VBoxContainer2/VBoxContainer/StartButton
@onready var settings_button: Button = $VBoxContainer2/VBoxContainer/SettingsButton
@onready var credits_button: Button = $VBoxContainer2/VBoxContainer/CreditsButton
@onready var exit_button: Button = $VBoxContainer2/VBoxContainer/ExitButton
@onready var settings_overlay: Control = $Settings
@onready var credits_overlay: Control = $Credits


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_button.pressed.connect(_on_start_button_pressed)
	settings_button.pressed.connect(_on_settings_button_pressed)
	credits_button.pressed.connect(_on_credits_button_pressed)
	exit_button.pressed.connect(_on_exit_button_pressed)
	

func _on_start_button_pressed() -> void:
	pass
	
func _on_settings_button_pressed() -> void:
	settings_overlay.visible = not settings_overlay.visible

func _on_credits_button_pressed() -> void:
	credits_overlay.visible = not credits_overlay.visible

func _on_exit_button_pressed() -> void:
	get_tree().quit()
