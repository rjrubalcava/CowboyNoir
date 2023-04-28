extends Control

@onready var ClubsCard: TextureRect = $ClubsCard
@onready var Locket: TextureRect = $Locket
@onready var HourHand: TextureRect = $HourHand

# Called when the node enters the scene tree for the first time.
func _ready():
	$Open.play() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

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
