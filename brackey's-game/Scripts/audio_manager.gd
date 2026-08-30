extends Node

const BGM_TRACK = preload("res://Sounds/Music/mus_main_theme.ogg")

const SFX_CORRECT = preload("res://Sounds/SFX/sfx_correct.wav")
const SFX_CURTAINS_TRANSITION = preload("res://Sounds/SFX/sfx_curtains_transission.wav")
const SFX_INCORRECT = preload("res://Sounds/SFX/sfx_incorrect.wav")
const SFX_UI_HOVER = preload("res://Sounds/SFX/sfx_ui_hover.wav")
const SFX_UI_SELECT = preload("res://Sounds/SFX/sfx_ui_select.wav")

@onready var music_player: AudioStreamPlayer = $MusicPlayer
@onready var ui_player: AudioStreamPlayer = $UISoundPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	music_player.stream = BGM_TRACK
	music_player.play()
	
func play_sfx(stream: AudioStream, pitch_variance: float = 0.0) -> void:
	if not stream:
		return
	ui_player.pitch_scale = randf_range(1.0 - pitch_variance, 1.0 + pitch_variance) if pitch_variance > 0.0 else 1.0
	ui_player.stream = stream
	ui_player.play()
	
func play_hover() -> void:
	play_sfx(SFX_UI_HOVER, 0.05)
	
func play_select() -> void:
	play_sfx(SFX_UI_SELECT)

func play_correct() -> void:
	play_sfx(SFX_CORRECT)

func play_incorrect() -> void:
	play_sfx(SFX_INCORRECT)
	
func play_curtains() -> void:
	play_sfx(SFX_CURTAINS_TRANSITION)
	
func toggle_music(enable: bool) -> void:
	music_player.stream_paused = !enable
