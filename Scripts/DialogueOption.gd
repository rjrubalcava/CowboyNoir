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
	# Execute actions associated with this option
	for action in actions:
		if action == "tutorial":
			pass
		elif action == "+stress":
			get_parent().get_node("MainScene").get_node("Bluff").updateStress(30)
		elif action == "-stress":
			get_parent().get_node("MainScene").get_node("Bluff").updateStress(-30)
	Global.playDialogue(outcome)
	
