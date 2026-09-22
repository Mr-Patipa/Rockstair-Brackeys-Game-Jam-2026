extends Control

@export var left_curtain: TextureRect
@export var right_curtain: TextureRect

var isClosed : bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	curtain_switch()

func change_scene(destination):

	get_tree().change_scene_to_file(destination)
	pass

func change_ui():
	# used when changing what appear on screen without explicitly changing scene
	pass

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
	tween.tween_property(left_curtain, "offset_transform_position_ratio:x", 0, 1.0)
	tween.tween_property(right_curtain, "offset_transform_position_ratio:x", 0, 1.0)

func _do_curtain_open():
	var tween = create_tween().set_parallel(true)
	tween.set_trans(Tween.TRANS_QUAD)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(left_curtain, "offset_transform_position_ratio:x", -1280, 1.0)
	tween.tween_property(right_curtain, "offset_transform_position_ratio:x", 1280, 1.0)
