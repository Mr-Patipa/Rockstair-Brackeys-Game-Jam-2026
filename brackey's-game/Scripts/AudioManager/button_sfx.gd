class_name ButtonSFX
extends BaseButton

@export var play_hover_sound: bool = true
@export var play_press_sound: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if play_hover_sound:
		mouse_entered.connect(_on_hover)
	
	if play_press_sound:
		pressed.connect(_on_press)

func _on_hover() -> void:
	AudioManager.play_hover()
	
func _on_press() -> void:
	AudioManager.play_select()
