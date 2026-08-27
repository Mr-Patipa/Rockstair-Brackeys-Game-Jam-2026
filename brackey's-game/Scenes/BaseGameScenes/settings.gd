extends Control

@export_group("Volume")
@export_subgroup("Slider Node")
@export var master_h_slider = HSlider
@export var music_h_slider: HSlider
@export var sfx_h_slider: HSlider

@export_subgroup("Audio Bus")
@export var master_audio_bus = "Master"
@export var music_audio_bus = "Music"
@export var sfx_audio_bus = "SFX"

@export_group("Display")
@export var option_button: OptionButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	master_h_slider.value_changed.connect(_on_master_volume_changed)
	music_h_slider.value_changed.connect(_on_music_volume_changed)
	sfx_h_slider.value_changed.connect(_on_sfx_volume_changed)
	
	option_button.item_selected.connect(_on_screen_resolution_changed)

func _on_master_volume_changed(value) -> void:
	print(value)

func _on_music_volume_changed(value) -> void:
	print(value)
	
func _on_sfx_volume_changed(value) -> void:
	print(value)
	
func _on_screen_resolution_changed(value) -> void:
	print(value)
	
	if value == 0:
		pass
	elif value == 1:
		pass
	elif value == 2:
		pass
