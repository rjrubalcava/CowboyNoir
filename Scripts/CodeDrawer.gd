extends Control

var current_selector = 0
var letter_indices = [0,0,0,0]
var alphabet = [0,1,2,3,4,5,6,7,8,9]
var result =[]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
	elif event.is_action_pressed("ui_left"):
		if current_selector != 0:
			current_selector-=1
			#$Cursor.set("rect_position", Vector2($Cursor.get("rect_position").x - 80, $Cursor.get("rect_position").y))
	elif event.is_action_pressed("ui_right"):
		if current_selector != 3:
			current_selector+=1
			#$Cursor.set("rect_position", Vector2($Cursor.get("rect_position").x + 80, $Cursor.get("rect_position").y))
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
		
	# Mark input as handled so it won't trigger multiple times per keypress

func open_drawer():
	if result[0]== "1" and result[1]=="2" and result[2]=="3"  and result[3]=="4":
		get_tree().change_scene_to_file("res://Scenes/OpenDrawer.tscn")
	else:
		print("Try again, the passsword is not correct")
