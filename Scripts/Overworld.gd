extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _input(event):
	# Close journal if it is open and esc is pressed
	if event.is_action_pressed("ui_cancel") and $Journal.visible:
		$Journal.hide()


func _on_amity_sel_pressed():
	# Square off against Amity
	$Click.play()
	get_parent().startBluff("amity")


func _on_journal_button_pressed():
	# Open journal
	$Click.play()
	if $Journal.visible:
		$Journal.hide()
	else:
		$Journal.show()
