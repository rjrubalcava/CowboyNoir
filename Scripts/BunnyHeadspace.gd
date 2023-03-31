extends Control

@onready var Clock: TextureRect = $Clock
@onready var Newspaper: TextureRect = $Newspaper
@onready var TheSun: TextureRect = $TheSun
var focused = false
var current_selector = 0
var letter_indices = [0,0,0,0]
var alphabet = [0,1,2,3,4,5,6,7,8,9]



#$Background, $Clock, $Newspaper, $Letter, $TreasureChest
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
	
#func _clear_zoom(focused_input, tween_name)
	#pass
	#$Clock.connect("input_event", $Clock._on_input_event)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

	
func _input(event):
	var TW = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if Clock.get_global_rect().has_point(event.position):
			TW.tween_property(Clock, "scale", Vector2(1, 1), 0.8 )
			TW.parallel().tween_property(Newspaper, "scale", Vector2(0.76, 0.76), 0.5 )
			TW.parallel().tween_property(TheSun, "scale", Vector2(0.76, 0.76), 0.5 )
		if Newspaper.get_global_rect().has_point(event.position):
			TW.tween_property(Newspaper, "scale", Vector2(1, 1), 0.8 )
			TW.parallel().tween_property(Clock, "scale", Vector2(0.76, 0.76), 0.5 )
			TW.parallel().tween_property(TheSun, "scale", Vector2(0.76, 0.76), 0.5 )
		if TheSun.get_global_rect().has_point(event.position):
			TW.tween_property(TheSun, "scale", Vector2(1, 1), 0.8 )
			TW.parallel().tween_property(Newspaper, "scale", Vector2(0.76, 0.76), 0.5 )
			TW.parallel().tween_property(Clock, "scale", Vector2(0.76, 0.76), 0.5 )
	
func _unhandled_input(event):
	
	if event.is_action_pressed("ui_up"):
		adjust_letter("up")
	elif event.is_action_pressed("ui_down"):
		adjust_letter("down")
	elif event.is_action_pressed("ui_left"):
		if current_selector != 0:
			current_selector-=1
			#$Cursor.set("rect_position", Vector2($Cursor.get("rect_position").x - 80, $Cursor.get("rect_position").y))
	elif event.is_action_pressed("ui_right"):
		if current_selector != 3:
			current_selector+=1
			#$Cursor.set("rect_position", Vector2($Cursor.get("rect_position").x + 80, $Cursor.get("rect_position").y))
			
	# Mark input as handled so it won't trigger multiple times per keypress
	
			
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

