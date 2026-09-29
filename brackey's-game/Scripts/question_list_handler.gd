extends Control

@export var QuestionList : QuestionsList
@export var Grid : GridContainer
@export var QuestionLabel : Label
@export var QuestionScreen : Control
@export var EndScreen : Control
@export var end_texture: TextureRect

@export_group("Explanation Screen")
@export var right_or_wrong_screen: Control
@export var explanation: Label
@export var right: TextureRect
@export var wrong: TextureRect

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

#===================================================#

func Show_Question_Answers() -> void:
	var current_q = QuestionList.Questions[CurrentQuestion]
	QuestionLabel.text = current_q.question
	var answers = current_q.AnswerList
	
	if answers.size() == 2:
		Deactivate_Button(option_1_button, false)
		Activate_Button(option_2_button, answers[0])
		Activate_Button(option_3_button, answers[1])
		Deactivate_Button(option_4_button, false)
		
	elif answers.size() == 4:
		Activate_Button(option_1_button, answers[0])
		Activate_Button(option_2_button, answers[1])
		Activate_Button(option_3_button, answers[2])
		Activate_Button(option_4_button, answers[3])
	else:
		push_error("Question " + str(CurrentQuestion + 1) + " is neither T/F nor MC")

#===================================================#

func Show_Question_Explanation(answer : bool) -> void:
	var current_q = QuestionList.Questions[CurrentQuestion]
	explanation.text = current_q.explanation
	
	Deactivate_Button(option_1_button, true)
	Deactivate_Button(option_2_button, true)
	Deactivate_Button(option_3_button, true)
	Deactivate_Button(option_4_button, true)
	
	await ScreenTransition.curtain_switch()
	
	right_or_wrong_screen.visible = true
	if answer == true:
		if wrong.visible == true:
			wrong.visible = false
			right.visible = true
	else:
		if right.visible == true:
			right.visible = false
			wrong.visible = true
			
	await ScreenTransition.curtain_switch()

func _on_explanation_gui_input(event : InputEvent):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			await ScreenTransition.curtain_switch()
			right_or_wrong_screen.visible = false
			Check_Status()
			await ScreenTransition.curtain_switch()

#func _on_end_screen_gui_input(event : InputEvent):
	#if event is InputEventMouseButton and event.pressed:
		#if event.button_index == MOUSE_BUTTON_LEFT:
				#get_tree().quit()

#===================================================#

func Activate_Button(button: Button, answer):
	if button.pressed.is_connected(Show_Question_Explanation):
		button.pressed.disconnect(Show_Question_Explanation)
	
	button.modulate.a = 1.0
	button.mouse_filter = Control.MOUSE_FILTER_STOP
	button.text = answer.AnswerText
	button.pressed.connect(Show_Question_Explanation.bind(answer.IsTrue))
	pass
	
func Deactivate_Button(button: Button, visible : bool):
	if not visible:
		button.modulate.a = 0.0
	button.mouse_filter = Control.MOUSE_FILTER_IGNORE

#===================================================#

func Check_Status() -> void:
	
	if CurrentQuestion + 1 < QuestionList.Questions.size():
		
		CurrentQuestion += 1
	
	else:
		QuestionScreen.visible = false
		EndScreen.visible = true
