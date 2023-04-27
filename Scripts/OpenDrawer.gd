extends Control

@onready var ClubsCard: TextureRect = $ClubsCard
@onready var Locket: TextureRect = $Locket
@onready var HourHand: TextureRect = $HourHand

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.clubcardclick == true:
		ClubsCard.hide()
	if Global.hourhandclick == true:
		HourHand.hide()

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if ClubsCard.get_global_rect().has_point(event.position):
			Global.clubcardclick = true
		elif HourHand.get_global_rect().has_point(event.position):
			Global.hourhandclick = true
			
func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://Scenes/BunnyHeadspace.tscn")
		
func _on_clubs_card_mouse_entered():
	var TW = get_tree().create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(ClubsCard, "scale", Vector2(0.8,0.8), 0.1)


func _on_clubs_card_mouse_exited():
	var TW = get_tree().create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(ClubsCard, "scale", Vector2(0.76,0.76), 0.1)


func _on_locket_mouse_entered():
	var TW = get_tree().create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(Locket, "scale", Vector2(0.8,0.8), 0.1)


func _on_locket_mouse_exited():
	var TW = get_tree().create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(Locket, "scale", Vector2(0.76,0.76), 0.1)


func _on_hour_hand_mouse_entered():
	var TW = get_tree().create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(HourHand, "scale", Vector2(0.8,0.8), 0.1)


func _on_hour_hand_mouse_exited():
	var TW = get_tree().create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(HourHand, "scale", Vector2(0.76,0.76), 0.1)
