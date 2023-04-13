extends Control

var current_selector = 0
var letter_indices = [0,0,0,0]
var alphabet = [0,1,2,3,4,5,6,7,8,9]
var result =[]
@onready var Button1: TextureRect = $Buttons1
@onready var Button2: TextureRect = $Buttons2
@onready var Button3: TextureRect = $Buttons3
@onready var Button4: TextureRect = $Buttons4
var ticks = 0
var selected_button
var flag = false

# Called when the node enters the scene tree for the first time.


func _ready():
	pass
	

func change_color_button():
		var TW = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
		TW.tween_property(selected_button, "modulate", Color(0,0,0,0), 0.1)
		
func reset_color_button():
	selected_button.set_modulate(Color(1, 1, 1, 1))
	
func _process(delta):
	button_checker()
	if flag == true:
		ticks+=1
		if ticks == 30:
			change_color_button()
		elif ticks == 60:
			reset_color_button()
			ticks = 0
	else:
		pass
		
func adjust_letter(direction):
	
	var selector = null
	if current_selector == 0:
		selector = $NumberSelector1
	elif current_selector == 1:
		selector = $NumberSelector2
	elif current_selector == 2:
		selector =$NumberSelector3
	elif current_selector == 3:
		selector =$NumberSelector4
	if direction == "up":
		if letter_indices[current_selector] != 9:
			letter_indices[current_selector]+=1
	elif direction == "down":
		if letter_indices[current_selector] != 0:
			letter_indices[current_selector]-=1
	selector.set("text", alphabet[letter_indices[current_selector]])   

func _unhandled_input(event):
	
	if event.is_action_pressed("ui_up"):
		result.clear()
		adjust_letter("up")
	elif event.is_action_pressed("ui_down"):
		result.clear()
		adjust_letter("down")
	elif event.is_action_pressed("ui_right"):
		if current_selector != 3:
			current_selector+=1
		button_checker()
	elif event.is_action_pressed("ui_left"):
		if current_selector != 0:
			current_selector-=1
		button_checker()
	elif event.is_action_pressed("ui_accept"):
		var number1 = $NumberSelector1.text
		var number2 = $NumberSelector2.text
		var number3 = $NumberSelector3.text
		var number4 = $NumberSelector4.text
		number1.to_int()
		number2.to_int()
		number3.to_int()
		number4.to_int()
		result.append((number1))
		result.append((number2))
		result.append((number3))
		result.append((number4))
		open_drawer()
		
func open_drawer():
	if result[0]== "1" and result[1]=="2" and result[2]=="3"  and result[3]=="4":
		get_tree().change_scene_to_file("res://Scenes/OpenDrawer.tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/BunnyHeadspace.tscn")
		print("Try again, the passsword is not correct")

func button_checker():
	flag=true
	if current_selector == 0:
		selected_button = get_node("Buttons1")
		$Buttons2.set_modulate(Color(1, 1, 1, 1))
		$Buttons3.set_modulate(Color(1, 1, 1, 1))
		$Buttons4.set_modulate(Color(1, 1, 1, 1))
	elif current_selector == 1:
		selected_button = get_node("Buttons2")
		$Buttons1.set_modulate(Color(1, 1, 1, 1))
		$Buttons3.set_modulate(Color(1, 1, 1, 1))
		$Buttons4.set_modulate(Color(1, 1, 1, 1))
	elif current_selector == 2:
		selected_button = get_node("Buttons3")
		$Buttons1.set_modulate(Color(1, 1, 1, 1))
		$Buttons2.set_modulate(Color(1, 1, 1, 1))
		$Buttons4.set_modulate(Color(1, 1, 1, 1))
	elif current_selector == 3:
		selected_button = get_node("Buttons4")
		$Buttons1.set_modulate(Color(1, 1, 1, 1))
		$Buttons2.set_modulate(Color(1, 1, 1, 1))
		$Buttons3.set_modulate(Color(1, 1, 1, 1))
