extends Resource
class_name Answers

@export_multiline() var AnswerText : String
@export var IsTrue : bool = false : 
	set(value):
		IsTrue = value
		
		if IsTrue == true:
			GlobalSignalBus.on_correct_answer.emit()
		else:
			GlobalSignalBus.on_wrong_answer.emit()
