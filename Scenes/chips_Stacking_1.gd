extends AudioStreamPlayer

var curr_pitch = pitch_scale
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func process(delta):
	pass
func play_down(from_position=0.0):
	randomize()
	set_pitch_scale(curr_pitch - rand_rage(0.5,0.9))
	
	StreamPeer.play(from_position)
	
func play_up(from_position=0.0):
	
	
