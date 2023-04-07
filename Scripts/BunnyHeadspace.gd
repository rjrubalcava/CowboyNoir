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
@onready var MinuteHand: TextureRect = $MinuteHand
@onready var HeartCard: TextureRect = $HeartCard
@onready var DiamondCard: TextureRect = $DiamondCard
@onready var ClubCard: TextureRect = $ClubCard
@onready var SpadeCard: TextureRect = $SpadeCard
@onready var Frame: TextureRect = $Frame
@onready var CodeDrawer: TextureRect = $CodeDrawer
var Enlarged_Newspaper_sprite: Sprite2D


	
#$Background, $Clock, $Newspaper, $Letter, $TreasureChest
# Called when the node enters the scene tree for the first time.
func _ready():
	Enlarged_Newspaper_sprite = Sprite2D.new()
	Enlarged_Newspaper_sprite.texture = EnlargedNewspaper
	Enlarged_Newspaper_sprite.scale = Vector2(0.75, 0.75)
	add_child(Enlarged_Newspaper_sprite)
	Enlarged_Newspaper_sprite.hide()
	
func _process(delta):
	#var c_oordinates = Newspaper.position
	#print(c_oordinates)
	#print(c_oordinates.y)
	pass
	
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
			scale_up(TW, Clock)
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
			InventoryBox.move_to_front()
			HourHand.move_to_front()
			MinuteHand.move_to_front()
			HeartCard.move_to_front()
			DiamondCard.move_to_front()
			ClubCard.move_to_front()
			SpadeCard.move_to_front()
			Frame.move_to_front()
			Enlarged_Newspaper_sprite.show()
		elif  TheSun.get_global_rect().has_point(event.position):
			change_texture(TW, Newspaper, SmallerNewspaper)
			scale_up(TW, TheSun)
			Enlarged_Newspaper_sprite.hide()
			change_position(TW, Newspaper, newspaper_coordinates)
			scale_down(TW,Clock)
			scale_down(TW, Newspaper)
		elif CodeDrawer.get_global_rect().has_point(event.position):
			get_tree().change_scene_to_file("res://Scenes/CodeDrawer.tscn")
			
		elif Background.get_global_rect().has_point(event.position):
			change_texture(TW, Newspaper, SmallerNewspaper)
			scale_down(TW, TheSun)
			scale_down(TW, Newspaper)
			scale_down(TW, Clock)
			change_position(TW, Newspaper, newspaper_coordinates)
			Enlarged_Newspaper_sprite.hide()
