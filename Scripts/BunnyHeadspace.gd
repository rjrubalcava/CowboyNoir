extends Control

@onready var Clock: TextureRect = $Clock
@onready var Newspaper: TextureRect = $Newspaper
@onready var TheSun: TextureRect = $TheSun
@onready var Background: TextureRect = $Background
@onready var Midground: TextureRect = $Midground
@onready var EnlargedNewspaper = preload("res://Assets/BunnyHeadspace/Newspaper/newspaper close up.png")
@onready var SmallerNewspaper = preload("res://Assets/BunnyHeadspace/Zoom out/newspaper.png")
@onready var InventoryBox: TextureRect = $InventoryBox
@onready var HourHand: TextureRect = $HourHand
@onready var MinuteHand: CharacterBody2D = $MinuteHand
@onready var HeartCard: TextureRect = $HeartCard
@onready var DiamondCard: TextureRect = $DiamondCard
@onready var HeartsCardGround: TextureRect = $HeartsCard
@onready var ClubCard: TextureRect = $ClubCard
@onready var SpadeCard: TextureRect = $SpadeCard
@onready var Frame: TextureRect = $Frame
@onready var CodeDrawer: TextureRect = $CodeDrawer
@onready var CostumeChest: TextureRect = $CostumeChest
var Enlarged_Newspaper_sprite: Sprite2D
var selected = false
var minutehandclicked=false
var mouse_pos = Vector2()
var mouse_velocity = Vector2()


func _ready():
	
	mouse_pos = get_global_mouse_position()
	Enlarged_Newspaper_sprite = Sprite2D.new()
	Enlarged_Newspaper_sprite.texture = EnlargedNewspaper
	Enlarged_Newspaper_sprite.scale = Vector2(0.75, 0.75)
	add_child(Enlarged_Newspaper_sprite)
	Enlarged_Newspaper_sprite.hide()
	HeartCard.hide()
	HourHand.hide()
	MinuteHand.hide()
	DiamondCard.hide()
	ClubCard.hide()
	SpadeCard.hide()

func _process(delta):
	var current_mouse_pos = get_global_mouse_position()
	mouse_velocity = (current_mouse_pos - mouse_pos) / delta
	mouse_pos = current_mouse_pos
	if Global.clubcardclick == true:
		ClubCard.show()
	if Global.hourhandclick == true:
		HourHand.show()
	if Global.heartcardclick == true:
		HeartsCardGround.hide()
		HeartCard.show()
	if Global.minutecardclick == true:
		MinuteHand.show()
	if minutehandclicked == true:
		drag()
		
func scale_up(my_tween, my_sprite):
	if my_sprite == Newspaper:
		Enlarged_Newspaper_sprite.scale = Vector2(1.5, 1.5)
		my_tween.tween_property(my_sprite, "scale", Vector2(1.2, 1.2), 0.8 )
	else:
		Enlarged_Newspaper_sprite.scale = Vector2(0.75, 0.75)
		my_tween.tween_property(my_sprite, "scale", Vector2(1, 1), 0.8 )

func scale_down(my_tween, my_sprite):
	if my_sprite == Newspaper:
		my_tween.parallel().tween_property(my_sprite, "scale", Vector2(0.76, 0.76), 0.5 )
	else:
		my_tween.parallel().tween_property(my_sprite, "scale", Vector2(0.76, 0.76), 0.5 )
	
func change_texture(my_tween, old_texture, new_texture):
	if new_texture == EnlargedNewspaper:
		my_tween.parallel().tween_property(old_texture, "texture", new_texture, 0.8)
	elif new_texture == SmallerNewspaper:
		my_tween.parallel().tween_property(old_texture, "texture", new_texture, 0.01)

func change_position(my_tween, my_sprite, pos):
	my_tween.parallel().tween_property(my_sprite, "position", Vector2(pos.x, pos.y), 0.2)
	
func _input(event):
	var newspaper_coordinates = Newspaper.position
	var center = Vector2(1000,550)
	var TW = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		
		if Clock.get_global_rect().has_point(event.position):
			change_texture(TW, Newspaper, SmallerNewspaper)	
			Enlarged_Newspaper_sprite.hide()
			#scale_up(TW, Clock)
			change_position(TW, Newspaper, newspaper_coordinates)
			scale_down(TW,TheSun)
			scale_down(TW,Newspaper)
		elif  Newspaper.get_global_rect().has_point(event.position):
			scale_up(TW, Newspaper)
			change_texture(TW, Newspaper, Enlarged_Newspaper_sprite)
			change_position(TW, Enlarged_Newspaper_sprite, center)
			scale_down(TW, Clock)
			scale_down(TW, TheSun)
			await get_tree().create_timer(0.8).timeout
			Enlarged_Newspaper_sprite.show()
			Enlarged_Newspaper_sprite.z_index = 5
		elif  TheSun.get_global_rect().has_point(event.position):
			change_texture(TW, Newspaper, SmallerNewspaper)
			scale_up(TW, TheSun)
			Enlarged_Newspaper_sprite.hide()
			change_position(TW, Newspaper, newspaper_coordinates)
			scale_down(TW,Clock)
			scale_down(TW, Newspaper)
		elif CodeDrawer.get_global_rect().has_point(event.position):
			get_tree().change_scene_to_file("res://Scenes/CodeDrawerVanity.tscn")
		elif CostumeChest.get_global_rect().has_point(event.position):
			get_tree().change_scene_to_file("res://Scenes/CodeDrawerChest.tscn")
		elif HeartsCardGround.get_global_rect().has_point(event.position):
			Global.heartcardclick =true
			
		elif Background.get_global_rect().has_point(event.position):
			change_texture(TW, Newspaper, SmallerNewspaper)
			scale_down(TW, TheSun)
			scale_down(TW, Newspaper)
			scale_down(TW, Clock)
			change_position(TW, Newspaper, newspaper_coordinates)
			Enlarged_Newspaper_sprite.hide()
			
	if Global.clubcardclick == true:
		ClubCard.show()
	if Global.hourhandclick == true:
		HourHand.show()
		
func _on_code_drawer_mouse_entered():
	var TW = get_tree().create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(CodeDrawer, "scale", Vector2(0.8,0.8), 0.1)

func _on_code_drawer_mouse_exited():
	var TW = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(CodeDrawer, "scale", Vector2(0.76,0.76), 0.1)


func _on_clock_mouse_entered():
	
	var TW = get_tree().create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(Clock, "modulate", Color.ROSY_BROWN, 0.1)


func _on_clock_mouse_exited():
	Clock.set_modulate(Color(1, 1, 1, 1))


func _on_the_sun_mouse_entered():
	var TW = get_tree().create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(TheSun, "modulate", Color.ROSY_BROWN, 0.1)


func _on_the_sun_mouse_exited():
	TheSun.set_modulate(Color(1, 1, 1, 1))


func _on_hour_hand_mouse_entered():
	var TW = get_tree().create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(HourHand, "scale", Vector2(0.8,0.8), 0.1)
	


func _on_hour_hand_mouse_exited():
	var TW = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(HourHand, "scale", Vector2(0.76,0.76), 0.1)


func _on_minute_hand_mouse_entered():
	var TW = get_tree().create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(MinuteHand, "scale", Vector2(0.8,0.8), 0.1)


func _on_minute_hand_mouse_exited():
	var TW = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(MinuteHand, "scale", Vector2(0.76,0.76), 0.1)


func _on_heart_card_mouse_entered():
	var TW = get_tree().create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(HeartCard, "scale", Vector2(0.8,0.8), 0.1)


func _on_heart_card_mouse_exited():
	var TW = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(HeartCard, "scale", Vector2(0.76,0.76), 0.1)


func _on_diamond_card_mouse_entered():
	var TW = get_tree().create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(DiamondCard, "scale", Vector2(0.8,0.8), 0.1)


func _on_diamond_card_mouse_exited():
	var TW = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(DiamondCard, "scale", Vector2(0.76,0.76), 0.1)


func _on_club_card_mouse_entered():
	var TW = get_tree().create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(ClubCard, "scale", Vector2(0.8,0.8), 0.1)


func _on_club_card_mouse_exited():
	var TW = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(ClubCard, "scale", Vector2(0.76,0.76), 0.1)


func _on_spade_card_mouse_entered():
	var TW = get_tree().create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(SpadeCard, "scale", Vector2(0.8,0.8), 0.1)


func _on_spade_card_mouse_exited():
	var TW = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(SpadeCard, "scale", Vector2(0.76,0.76), 0.1)


func _on_newspaper_mouse_entered():
	var TW = get_tree().create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(Newspaper, "modulate", Color.ROSY_BROWN, 0.1)


func _on_newspaper_mouse_exited():
	Newspaper.set_modulate(Color(1, 1, 1, 1))
	

func _on_costume_chest_mouse_entered():
	var TW = get_tree().create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(CostumeChest, "scale", Vector2(0.8,0.8), 0.1)

func _on_costume_chest_mouse_exited():
	var TW = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(CostumeChest, "scale", Vector2(0.76,0.76), 0.1)


func _on_minute_hand_gui_input(event):
	if Input.is_action_pressed("click"):
		minutehandclicked = true
	else:
		minutehandclicked = false
func drag():
	MinuteHand.velocity = mouse_velocity
	MinuteHand.move_and_slide()
	
