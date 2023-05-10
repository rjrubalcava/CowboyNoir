extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_help_pressed():
	$HelpPage.show()


func _on_amity_pressed():
	$HelpPage.hide()
