extends Node2D
@onready var HourHand: CharacterBody2D = $HourHand
@onready var MinuteHand: CharacterBody2D = $MinuteHand
var mouse_pos = Vector2()
var mouse_velocity = Vector2()
var minutehandclicked=false
var hourhandclicked = false
var minutehandtouched = false
var hourhandtouched = false
var area_is_touched = false
# Called when the node enters the scene tree for the first time.
func _ready():
	#HourHand.hide()
	#MinuteHand.hide()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var current_mouse_pos = get_global_mouse_position()
	mouse_velocity = (current_mouse_pos - mouse_pos) / delta
	mouse_pos = current_mouse_pos
	if Global.minutecardclick == true:
		MinuteHand.show()
	if Global.hourhandclick == true:
		HourHand.show()
	if hourhandclicked == true:
		drag(HourHand)
	if minutehandclicked == true:
		drag(MinuteHand)
	
func drag(my_sprite):
	my_sprite.velocity = mouse_velocity
	my_sprite.move_and_slide()


func _on_area_2d_hour_hand_area_entered(area):
	hourhandtouched = true


func _on_area_2d_hour_hand_area_exited(area):
	hourhandtouched = false



func _on_area_2d_minute_hand_area_entered(area):
	minutehandtouched = true


func _on_area_2d_minute_hand_area_exited(area):
	minutehandtouched = false


func _on_area_2d_hour_hand_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		hourhandclicked = true
	else:
		hourhandclicked = false


func _on_area_2d_minute_hand_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		minutehandclicked = true
	else:
		minutehandclicked = false


func _on_area_2d_area_entered(area):
	
	if hourhandtouched == true and minutehandtouched == true:
		area_is_touched =true
<<<<<<< Updated upstream
		print("Both tocuhed")
=======
		Global.puzzlesolved = true
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://Scenes/BunnyHeadspace.tscn")
		await get_tree().create_timer(0.5).timeout
		
func move_hands(my_sprite):
	if my_sprite == HourHand:
		var TW = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
		TW.tween_property(my_sprite, "position", Vector2(780,450), 0.5) 
	elif my_sprite == MinuteHand:
		var TW = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
		TW.tween_property(my_sprite, "position", Vector2(860,450), 0.5) 
>>>>>>> Stashed changes
