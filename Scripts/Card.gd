extends Sprite2D

@onready var back = preload("res://Assets/Cards/Z_RNDM/Backs/2B.png")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var focused = false
var notSelected = true
var readyToPlay = false
var card_offset=0
var cardID = null
var tween
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func setReady(val):
	readyToPlay = val

func setCardID(m_cid):
	cardID = m_cid

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and readyToPlay:
		if get_rect().has_point(to_local(event.position)) and (focused):
			card_offset+=300
			if(notSelected):
				tween = get_tree().create_tween()
				tween.set_ease(Tween.EASE_IN_OUT)
				#print(self.position)
				tween.tween_property(self, "position", Vector2(520, 940), 1)
				notSelected = false
				scale *= 1.25       
				set_texture(back)
				set_scale(Vector2(.3,.1))
				notSelected = false
			#print("A click!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Card_Background_mouse_entered():
	if(notSelected):
		scale*=1.25
		move_to_front()
		focused = true 
	# Replace with function body.


func _on_Card_Background_mouse_exited():
	if(notSelected):
		scale /= 1.25
		focused = false 

