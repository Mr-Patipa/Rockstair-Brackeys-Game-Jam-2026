extends Control


@export var QuestionList : QuestionsList
@export var OptionsBtn : PackedScene
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
		option_1_button.modulate.a = 0.0
		option_1_button.mouse_filter = Control.MOUSE_FILTER_IGNORE
		
		option_2_button.text = answers[0].AnswerText
		option_2_button.pressed.connect(Check_Status.bind(answers[0]))
		
		option_3_button.text = answers[1].AnswerText
		option_3_button.pressed.connect(Check_Status.bind(answers[1]))
		
		option_4_button.modulate.a = 0.0
		option_4_button.mouse_filter = Control.MOUSE_FILTER_IGNORE
		
	elif answers.size() == 4:
		option_1_button.modulate.a = 1.0
		option_1_button.mouse_filter = Control.MOUSE_FILTER_STOP
		option_1_button.text = answers[0].AnswerText
		option_1_button.pressed.connect(Check_Status.bind(answers[0]))
		
		option_2_button.text = answers[1].AnswerText
		option_2_button.pressed.connect(Check_Status.bind(answers[1]))
		
		option_3_button.text = answers[2].AnswerText
		option_3_button.pressed.connect(Check_Status.bind(answers[2]))
		
		option_4_button.modulate.a = 1.0
		option_4_button.mouse_filter = Control.MOUSE_FILTER_STOP
		option_4_button.text = answers[3].AnswerText
		option_4_button.pressed.connect(Check_Status.bind(answers[3]))
	else:
		push_error("Question " + str(CurrentQuestion + 1) + " is neither T/F nor MC")
		
		
func Check_Status(answer) -> void:
	print(answer)
	
	if CurrentQuestion + 1 <= QuestionList.Questions.size() - 1:
		CurrentQuestion += 1
	
	else:
		QuestionScreen.visible = false
		EndScreen.visible = true
