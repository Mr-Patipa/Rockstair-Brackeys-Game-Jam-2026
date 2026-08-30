class_name SliderSFX
extends HSlider

@export var play_hover_sound: bool = true
@export var step_threshold: float = 0.05
@export var min_pitch: float = 0.6
@export var max_pitch: float = 1.6

var _last_sound_value: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_last_sound_value = value
	
	if play_hover_sound:
		mouse_entered.connect(AudioManager.play_hover)
		
	value_changed.connect(_on_value_changed)

func _on_value_changed(new_value: float) -> void:
	var value_range = max_value - min_value
	if value_range == 0:
		return
	
	if abs(new_value - _last_sound_value) >= (value_range * step_threshold):
		_last_sound_value = new_value
		
		var normalized = (new_value - min_value) / value_range
		var target_pitch = lerpf(min_pitch, max_pitch, normalized)
		
		_play_slider_tick(target_pitch)

func _play_slider_tick(pitch: float) -> void:
	AudioManager.ui_player.pitch_scale = pitch
	AudioManager.ui_player.stream = AudioManager.SFX_UI_HOVER
	AudioManager.ui_player.play()
	
