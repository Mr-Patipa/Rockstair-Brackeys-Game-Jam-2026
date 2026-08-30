extends Resource
class_name Answers

@export_multiline() var AnswerText : String
@export var IsTrue : bool = false 


func Check_Answers() -> void:
	if IsTrue == true:
		GlobalSignalBus.on_answer_chosen.emit(true)
	else:
		GlobalSignalBus.on_answer_chosen.emit(false)
