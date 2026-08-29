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
var master_bus_id
var music_bus_id
var sfx_bus_id

@export_group("Display")
@export var resolution_option: OptionButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#VOLUME
	master_h_slider.value_changed.connect(_on_master_volume_changed)
	music_h_slider.value_changed.connect(_on_music_volume_changed)
	sfx_h_slider.value_changed.connect(_on_sfx_volume_changed)
	
	master_bus_id = AudioServer.get_bus_index(master_audio_bus)
	music_bus_id = AudioServer.get_bus_index(music_audio_bus)
	sfx_bus_id =AudioServer.get_bus_index(sfx_audio_bus)
	
	#DISPLAY
	resolution_option.item_selected.connect(_on_screen_resolution_selected)


func _on_master_volume_changed(value) -> void:
	AudioServer.set_bus_volume_linear(master_bus_id, value)

func _on_music_volume_changed(value) -> void:
	AudioServer.set_bus_volume_linear(music_bus_id, value)
	
func _on_sfx_volume_changed(value) -> void:
	AudioServer.set_bus_volume_linear(sfx_bus_id, value)



func _on_screen_resolution_selected(index) -> void:
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920, 1080))
		1:
			DisplayServer.window_set_size(Vector2i(1600, 900))
		2:
			DisplayServer.window_set_size(Vector2i(1280, 720))
