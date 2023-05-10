extends Control

var creditsShown
var introSkipped

# Called when the node enters the scene tree for the first time.
func _ready():
	introSkipped = false
	$IntroVid.play()
	await get_tree().create_timer(60).timeout
	if not introSkipped:
		begin()

func _input(event):
	# Close credits if they are open and esc is pressed
	if event.is_action_pressed("ui_cancel"):
		if $CreditsPage.visible:
			$CreditsPage.hide()
		elif $IntroVid.visible:
			introSkipped = true
			begin()
			
func begin():
	$IntroVid.stop()
	await get_tree().create_timer(2).timeout
	var TW = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	TW.tween_property($Background, "position", Vector2(0, 0), 8)
	await get_tree().create_timer(9).timeout
	$ButtonHolder.show()
	$StartMusicIntro.play()

func _on_start_button_pressed():
	# Launch game
	$Click.play()
	get_tree().change_scene_to_file("res://Scenes/MainScene.tscn")
	
func _on_start_button_mouse_entered():
	$ButtonHolder/Play/Texture.hide()
	$ButtonHolder/Play/HoverTexture.show()
	
func _on_start_button_mouse_exited():
	$ButtonHolder/Play/HoverTexture.hide()
	$ButtonHolder/Play/Texture.show()

func _on_credits_button_pressed():
	# Open credits
	$Click.play()
	$CreditsPage.show()
	
func _on_credits_button_mouse_entered():
	$ButtonHolder/Credits/Texture.hide()
	$ButtonHolder/Credits/HoverTexture.show()
	
func _on_credits_button_mouse_exited():
	$ButtonHolder/Credits/HoverTexture.hide()
	$ButtonHolder/Credits/Texture.show()
	
func _on_exit_button_pressed():
	# Quit the game
	$Click.play()
	get_tree().quit()
	
func _on_exit_button_mouse_entered():
	$ButtonHolder/Exit/Texture.hide()
	$ButtonHolder/Exit/HoverTexture.show()
	
func _on_exit_button_mouse_exited():
	$ButtonHolder/Exit/HoverTexture.hide()
	$ButtonHolder/Exit/Texture.show()

func _on_exits_music_intro_finished():
	$StartMusicLoop.play()
