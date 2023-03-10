extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var focused = false
var notSelected = true
var tween = Tween.new()
var card_offset=0
# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(tween)
	tween.interpolate_property(self, "position", position, Vector2(-400, -700), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)) and (focused):
			card_offset+=300
			if(notSelected):
				tween.start()
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
	raise()
	focused = true 
	# Replace with function body.


func _on_Card_Background_mouse_exited():
	scale /= 1.25
	focused = false 

