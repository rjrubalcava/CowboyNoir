extends Control

@onready var Knife : TextureRect = $Knife
@onready var MinuteHand : TextureRect = $MinuteHand

# Called when the node enters the scene tree for the first time.
func _ready():
	$ChestOpening.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.minutecardclick == true:
		MinuteHand.hide()

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if MinuteHand.get_global_rect().has_point(event.position):
			Global.minutecardclick = true
	if event.is_action_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://Scenes/BunnyHeadspace.tscn")


func _on_minute_hand_mouse_entered():
	var TW = get_tree().create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(MinuteHand, "scale", Vector2(0.52,0.52), 0.1)


func _on_minute_hand_mouse_exited():
	var TW = get_tree().create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property(MinuteHand, "scale", Vector2(0.5,0.5), 0.1)
