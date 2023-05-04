extends Control
# RefCounted: I found the means of making the button invisible but still interactable here: 
# https://godotengine.org/qa/111711/how-to-make-an-button-invisible

var outcome = -1
var actions = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called when button is clicked. Scene is instanced and then immediately provided an outcome,
# so initial error value of -1 should not be reached
func _on_button_pressed():
	$Click.play()
	# Play dialogue first
	Global.playDialogue(outcome)
	# Execute actions associated with chosen option
	for action in actions:
		if action == "increase":
			# Increase stress
			get_parent().get_node("MainScene").get_node("Bluff").updateStress(20)
			# Hide dialogue to begin round of Bluff
			Global.current_prompt.hide()
			for option in Global.current_options:
				option.hide()
			get_parent().get_node("MainScene").continueGame();
		elif action == "neutral":
			# Hide dialogue to begin round of Bluff
			Global.current_prompt.hide()
			for option in Global.current_options:
				option.hide()
			get_parent().get_node("MainScene").continueGame();
		elif action == "dismiss":
			# reinitialize global dialogue status
			Global.current_prompt = null
			Global.current_options = []
			# Return player to overworld
			get_tree().change_scene_to_file("res://Scenes/Overworld.tscn")
		elif action == "force_breakpoint":
			# Max stress
			get_parent().get_node("MainScene").get_node("Bluff").updateStress(500)
			# Hide dialogue
			Global.current_prompt.hide()
			for option in Global.current_options:
				option.hide()
			# Hide bluff
			get_parent().get_node("MainScene").stopGame();


func _on_left_button_mouse_entered():
	$LeftOpt/Texture.hide()
	$LeftOpt/HoverTexture.show()
	$LeftOpt.scale *= 1.5
	
func _on_left_button_mouse_exited():
	$LeftOpt/HoverTexture.hide()
	$LeftOpt/Texture.show()
	$LeftOpt.scale /= 1.5

func _on_right_button_mouse_entered():
	$RightOpt/Texture.hide()
	$RightOpt/HoverTexture.show()
	$RightOpt.scale *= 1.5
	
func _on_right_button_mouse_exited():
	$RightOpt/HoverTexture.hide()
	$RightOpt/Texture.show()
	$RightOpt.scale /= 1.5
