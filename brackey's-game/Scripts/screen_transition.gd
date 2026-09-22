extends Control

@export var left_curtain: TextureRect
@export var right_curtain: TextureRect
@export var tweenDuration = 0.3

signal curtain_fully_closed

var isClosed : bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	curtain_switch()

func change_scene(destination):
	_do_curtain_close()
	get_tree().change_scene_to_file(destination)
	_do_curtain_open()

func change_ui():
	_do_curtain_close()
	
	_do_curtain_open()

func curtain_switch():
	if isClosed == true:
		_do_curtain_open()
		isClosed = not isClosed
	else:
		_do_curtain_close()
		isClosed = not isClosed
	

func _do_curtain_close():
	var tween = create_tween().set_parallel(true)
	tween.set_trans(Tween.TRANS_QUAD)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(left_curtain, "offset_transform_position_ratio:x", 0, tweenDuration)
	tween.tween_property(right_curtain, "offset_transform_position_ratio:x", 0, tweenDuration)
	await tween.finished

func _do_curtain_open():
	var tween = create_tween().set_parallel(true)
	tween.set_trans(Tween.TRANS_QUAD)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(left_curtain, "offset_transform_position_ratio:x", -1280, tweenDuration)
	tween.tween_property(right_curtain, "offset_transform_position_ratio:x", 1280, tweenDuration)
	await tween.finished
