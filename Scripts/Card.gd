extends Sprite2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var focused = false
var notSelected = true
var card_offset=0
var tween
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)) and (focused):
			card_offset+=300
			if(notSelected):
				tween = get_tree().create_tween()
				tween.set_ease(Tween.EASE_IN_OUT)
				tween.tween_property(self, "position", Vector2(-400, -700), 1)
				notSelected = false
				scale *= 1.25       
			else:
				notSelected = true
				scale /= 1.25
			print("A click!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Card_Background_mouse_entered():
	scale*=1.25
	move_to_front()
	focused = true 
	# Replace with function body.


func _on_Card_Background_mouse_exited():
	scale /= 1.25
	focused = false 

