extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_amity_sel_pressed():
	$Click.play()
	get_parent().startBluff("amity")
