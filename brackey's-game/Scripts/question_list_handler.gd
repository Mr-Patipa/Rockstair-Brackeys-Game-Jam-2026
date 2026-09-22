extends Control

@export var QuestionList : QuestionsList
@export var Grid : GridContainer
@export var QuestionLabel : Label
@export var QuestionScreen : Control
@export var EndScreen : Control

@export_group("Option Button")
@export var option_1_button: Button
@export var option_2_button: Button
@export var option_3_button: Button
@export var option_4_button: Button

var CurrentQuestion : int = 0 : 
	set(value):
		CurrentQuestion = value
		Show_Question_Answers()	

func _ready() -> void:
	Show_Question_Answers()
	GlobalSignalBus.on_answer_chosen.connect(Check_Status)

func Show_Question_Answers() -> void:
	var current_q = QuestionList.Questions[CurrentQuestion]
	QuestionLabel.text = current_q.question
	var answers = current_q.AnswerList
	
	if answers.size() == 2:
		Deactivate_Button(option_1_button)
		Activate_Button(option_2_button, answers[0])
		Activate_Button(option_3_button, answers[1])
		Deactivate_Button(option_4_button)
		
	elif answers.size() == 4:
		Activate_Button(option_1_button, answers[0])
		Activate_Button(option_2_button, answers[1])
		Activate_Button(option_3_button, answers[2])
		Activate_Button(option_4_button, answers[3])
	else:
		push_error("Question " + str(CurrentQuestion + 1) + " is neither T/F nor MC")
		
func Activate_Button(button: Button, answer):
	button.pressed.disconnect(Check_Status)
	
	button.modulate.a = 1.0
	button.mouse_filter = Control.MOUSE_FILTER_STOP
	button.text = answer.AnswerText
	button.pressed.connect(Check_Status.bind(answer))
	pass
	
func Deactivate_Button(button: Button):
	button.modulate.a = 0.0
	button.mouse_filter = Control.MOUSE_FILTER_IGNORE

func Check_Status(answer) -> void:
	print(answer)
	
	if CurrentQuestion + 1 <= QuestionList.Questions.size() - 1:
		CurrentQuestion += 1
	
	else:
		QuestionScreen.visible = false
		EndScreen.visible = true
