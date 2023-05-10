extends Node2D
@onready var HourHand: CharacterBody2D = $HourHand
@onready var MinuteHand: CharacterBody2D = $MinuteHand
@onready var HeartCard: TextureRect = $HeartCard
@onready var DiamondCard: TextureRect = $DiamondCard
@onready var ClubCard: TextureRect = $ClubCard
@onready var SpadeCard: TextureRect = $SpadeCard
@onready var HourHandSp: TextureRect = $HourHand/HourHandSprite
@onready var MinuteHandSP: TextureRect = $MinuteHand/MinuteHandSprite
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
	HeartCard.hide()
	DiamondCard.hide()
	ClubCard.hide()
	SpadeCard.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var current_mouse_pos = get_global_mouse_position()
	mouse_velocity = (current_mouse_pos - mouse_pos) / delta
	mouse_pos = current_mouse_pos
	if Global.minutecardclick == true:
		MinuteHand.show()
	if Global.hourhandclick == true:
		HourHand.show()
	if Global.heartcardclick == true:
		HeartCard.show()
	if Global.diamondcardclick == true:
		DiamondCard.show()
	if Global.clubcardclick == true:
		ClubCard.show()
	if Global.spadecardclick == true:
		SpadeCard.show()
	if hourhandclicked == true:
		drag(HourHand)
	if minutehandclicked == true:
		drag(MinuteHand)
	area_checker()
	my_rotate()
func drag(my_sprite):
	my_sprite.velocity = mouse_velocity
	my_sprite.move_and_slide()

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://Scenes/BunnyHeadspace.tscn")

func _on_area_2d_hour_hand_area_entered(area):
	hourhandtouched = true
	move_hands(HourHand)


func _on_area_2d_hour_hand_area_exited(area):
	hourhandtouched = false



func _on_area_2d_minute_hand_area_entered(area):
	minutehandtouched = true
	move_hands(MinuteHand)

func _on_area_2d_minute_hand_area_exited(area):
	minutehandtouched = false



func _on_hour_hand_sprite_gui_input(event):
	if Input.is_action_pressed("click"):
		hourhandclicked = true
	else:
		hourhandclicked = false


func _on_minute_hand_sprite_gui_input(event):
	if Input.is_action_pressed("click"):
		minutehandclicked = true
	else:
		minutehandclicked = false

func area_checker():
	if hourhandtouched == true and minutehandtouched == true:
		area_is_touched =true
		Global.puzzlesolved = true
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://Scenes/BunnyHeadspace.tscn")
		await get_tree().create_timer(0.5).timeout
		
func move_hands(my_sprite):
	if my_sprite == HourHand:
		var TW = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
		TW.tween_property(my_sprite, "position", Vector2(780,450), 0.5) 
	elif my_sprite == MinuteHand:
		var TW = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
		TW.tween_property(my_sprite, "position", Vector2(860,450), 0.5) 
	


func _on_area_2d_minute_hand_mouse_entered():
	var TW = get_tree().create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(MinuteHand, "scale", Vector2(1.05,1.05), 0.1)


func _on_area_2d_minute_hand_mouse_exited():
	var TW = get_tree().create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(MinuteHand, "scale", Vector2(1,1), 0.1)
	


func _on_area_2d_hour_hand_mouse_entered():
	var TW = get_tree().create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(HourHand, "scale", Vector2(1.05,1.05), 0.1)


func _on_area_2d_hour_hand_mouse_exited():
	var TW = get_tree().create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(HourHand, "scale", Vector2(1,1), 0.1)

func my_rotate():
	if area_is_touched == true:
		await get_tree().create_timer(1).timeout
		var tween = get_tree().create_tween()
		tween.tween_property(HourHandSp, "rotation_degrees", (205), 1)
		tween.parallel().tween_property(MinuteHandSP, "rotation_degrees", (250), 1)
		area_is_touched = false
