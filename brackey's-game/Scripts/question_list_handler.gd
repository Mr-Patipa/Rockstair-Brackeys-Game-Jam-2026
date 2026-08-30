extends Control


@export var QuestionList : QuestionsList
@export var OptionsBtn : PackedScene
@export var Grid : GridContainer
@export var QuestionLabel : Label
@export var QuestionScreen : Control
@export var EndScreen : Control

var CurrentQuestion : int = 0 : 
	set(value):
		CurrentQuestion = value
		Show_Question_Answers()
		


func _ready() -> void:
	Show_Question_Answers()
	GlobalSignalBus.on_answer_chosen.connect(Check_Status)


func Show_Question_Answers() -> void:
	for children in Grid.get_children():
		children.queue_free()
	
	QuestionLabel.text = QuestionList.Questions[CurrentQuestion].question
	
	for answer in QuestionList.Questions[CurrentQuestion].AnswerList:
		var NewOptionBtn : Button = OptionsBtn.instantiate()
		NewOptionBtn.text = answer.AnswerText
		NewOptionBtn.pressed.connect(answer.Check_Answers)
		Grid.add_child(NewOptionBtn)

func Check_Status(answer) -> void:
	print(answer)
	
	if CurrentQuestion + 1 <= QuestionList.Questions.size() - 1:
		CurrentQuestion += 1
	
	else:
		QuestionScreen.visible = false
		EndScreen.visible = true
