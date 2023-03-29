extends Control

@onready var Clock: TextureRect = $Clock
@onready var Newspaper: TextureRect = $Newspaper
@onready var Letter: TextureRect = $Letter
var focused = false




#$Background, $Clock, $Newspaper, $Letter, $TreasureChest
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
#func _clear_zoom(focused_input, tween_name)
	#pass
	#$Clock.connect("input_event", $Clock._on_input_event)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

	
func _input(event):
	var TW = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN_OUT)
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if Clock.get_global_rect().has_point(event.position):
			TW.tween_property(Clock, "scale", Vector2(2.5, 2.5), 0.8 )
			TW.parallel().tween_property(Newspaper, "scale", Vector2(1, 1), 0.5 )
			TW.parallel().tween_property(Letter, "scale", Vector2(1, 1), 0.5 )
		if Newspaper.get_global_rect().has_point(event.position):
			TW.tween_property(Newspaper, "scale", Vector2(2.5, 2.5), 0.8 )
			TW.parallel().tween_property(Clock, "scale", Vector2(1, 1), 0.5 )
			TW.parallel().tween_property(Letter, "scale", Vector2(1, 1), 0.5 )
		if Letter.get_global_rect().has_point(event.position):
			TW.tween_property(Letter, "scale", Vector2(2.5, 2.5), 0.8 )
			TW.parallel().tween_property(Newspaper, "scale", Vector2(1, 1), 0.5 )
			TW.parallel().tween_property(Clock, "scale", Vector2(1, 1), 0.5 )
			
			
