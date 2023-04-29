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
		print("Both tocuhed")
