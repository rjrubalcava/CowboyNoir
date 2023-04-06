extends Control

@onready var Clock: TextureRect = $Clock
@onready var Newspaper: TextureRect = $Newspaper
@onready var TheSun: TextureRect = $TheSun
@onready var Background: TextureRect = $Background
@onready var Midground: TextureRect = $Midground
@onready var EnlargedNewspaper = preload("res://Assets/BunnyHeadspace/Newspaper/newspaper close up.png")
@onready var SmallerNewspaper = preload("res://Assets/BunnyHeadspace/Zoom out/newspaper.png")
var flag = false
var current_selector = 0
var letter_indices = [0,0,0,0]
var alphabet = [0,1,2,3,4,5,6,7,8,9]
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
	my_tween.tween_property(my_sprite, "scale", Vector2(1, 1), 0.8 )

func scale_down(my_tween, my_sprite):
	if my_sprite == Newspaper:
		my_tween.parallel().tween_property(my_sprite, "scale", Vector2(0.76, 0.76), 0.5 )
	else:
		my_tween.parallel().tween_property(my_sprite, "scale", Vector2(0.76, 0.76), 0.5 )
	
func change_texture(my_tween, old_texture, new_texture):
	my_tween.parallel().tween_property(old_texture, "texture", new_texture, 0.8)
	
func change_position(my_tween, my_sprite, pos):
	my_tween.parallel().tween_property(my_sprite, "position", Vector2(pos.x, pos.y), 0.2)
	
func _input(event):
	var newspaper_coordinates = Newspaper.position
	var center = Vector2(1200,500)
	flag = false
	
	var TW = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		
		if Clock.get_global_rect().has_point(event.position):
			Enlarged_Newspaper_sprite.hide()
			scale_up(TW, Clock)
			change_texture(TW, Newspaper, SmallerNewspaper)	
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
		elif  TheSun.get_global_rect().has_point(event.position):
			scale_up(TW, TheSun)
			change_texture(TW, Newspaper, SmallerNewspaper)
			Enlarged_Newspaper_sprite.hide()
			change_position(TW, Newspaper, newspaper_coordinates)
			scale_down(TW,Clock)
			scale_down(TW, Newspaper)
		elif Background.get_global_rect().has_point(event.position):
			scale_down(TW, TheSun)
			scale_down(TW, Newspaper)
			scale_down(TW, Clock)
			change_texture(TW, Newspaper, SmallerNewspaper)
			change_position(TW, Newspaper, newspaper_coordinates)
			Enlarged_Newspaper_sprite.hide()
		
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
