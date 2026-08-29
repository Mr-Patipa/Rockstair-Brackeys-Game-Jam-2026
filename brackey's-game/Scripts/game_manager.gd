extends Node
var score := 0

# put scene paths here
var question_scenes = [
	"res://scenes//trivialayoutscenes//multiplechoice.tscn"
]

	#you can call these functions from any script
func next_question():
	var chosen_question = question_scenes.pick_random()
	get_tree().change_scene_to_file(chosen_question)

func add_score(amount):
	score += amount
	
