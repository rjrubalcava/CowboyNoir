extends Control

@onready var clock: TextureRect = $Clock
@onready var Newspaper: TextureRect = $Newspaper
@onready var Letter: TextureRect = $Letter
var focused = false



#$Background, $Clock, $Newspaper, $Letter, $TreasureChest
# Called when the node enters the scene tree for the first time.
func _ready():
	var original_scale = clock.scale
	
#func _clear_zoom(focused_input, tween_name)
	#pass
	#$Clock.connect("input_event", $Clock._on_input_event)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_clock_entered(area):
	if area.get_parent() == Newspaper:
		clock.hide()

func _on_Newspaper_area_entered(area):
	if area.get_parent() == clock:
		Newspaper.hide()
	
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if clock.get_global_rect().has_point(event.position):
			#_on_other_object_pressed()
			var clock_tween = create_tween()
			clock_tween.tween_property(clock, "scale", Vector2(1.5, 1.5), 0.8 )
			#clock_tween.tween_callback(clock.set.bind(clock.Label,"I am a clock"))
			focused = true
		if Newspaper.get_global_rect().has_point(event.position):
			#_on_other_object_pressed()
			var newspaper_tween = create_tween()
			newspaper_tween.tween_property(Newspaper, "scale", Vector2(1.5, 1.5), 0.8 )
			newspaper_tween.tween_callback(Newspaper.set.bind(Newspaper,"I am a Newspaper"))
			
		if Letter.get_global_rect().has_point(event.position):
			#_on_other_object_pressed()
			var letter_tween = create_tween()
			letter_tween.tween_property(Letter, "scale", Vector2(1.5, 1.5), 0.8 )
			letter_tween.tween_callback(Letter.set.bind(Letter,"I am a Letter"))


