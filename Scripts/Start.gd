extends Control

var creditsShown

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _input(event):
	# Close credits if they are open and esc is pressed
	if event.is_action_pressed("ui_cancel") and $Credits.visible:
		$Credits.hide()


func _on_start_button_pressed():
	# Launch game
	$Click.play()
	get_tree().change_scene_to_file("res://Scenes/MainScene.tscn")


func _on_credits_button_pressed():
	# Open credits
	$Click.play()
	$Credits.show()


func _on_start_music_intro_finished():
	$StartMusicLoop.play()
