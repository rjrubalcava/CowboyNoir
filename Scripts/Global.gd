extends Node2D


var m_parent

# Dialogue vars
@onready var dialogueBox = preload("res://Scenes/DialogueBox.tscn")
@onready var dialogueOption = preload("res://Scenes/DialogueOption.tscn")
var character_dialogue_dict = {}
var player_dialogue_dict = {}
var current_prompt = null
var current_options = []
var character = "amity"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func newNode(node, location, parent, scaleMult):
	var newNode = node.instantiate()
	parent.add_child(newNode)
	newNode.global_position = location
	newNode.scale *= scaleMult
	return newNode

func init_dialogue():
	if character == "peter":
		# Depth 1
		character_dialogue_dict[0] = ["It's been a while Jack, you remember how to play?", [0,1], []]
		# Depth 3
		character_dialogue_dict[1] = ["Really? Well, it's not too hard.", [], ["tutorial"]]
		character_dialogue_dict[2] = ["Well let's get started then.", [2,3], []]
		# Depth 5
		character_dialogue_dict[3] = ["Really? Why?", [4,5], []]
		character_dialogue_dict[4] = ["Did you and Iris play this often? Before everything ... went south?", [6,7], []]
		# Depth 7
		character_dialogue_dict[5] = ["Well, it's still good fun.", [8,9], []]
		character_dialogue_dict[6] = ["She was pretty good, wasn't she?", [10], []]
		character_dialogue_dict[7] = ["Well ... you know.", [11], []]
		character_dialogue_dict[8] = ["Why are you here, Jack?", [12,13], []]
		# Depth 9
		character_dialogue_dict[9] = ["Whaddya mean?", [14,15], []]
		character_dialogue_dict[10] = ["Know what?", [16,17], []]
		character_dialogue_dict[11] = ["", [], []]
		character_dialogue_dict[12] = ["", [], []]
		character_dialogue_dict[13] = ["", [], []]
		character_dialogue_dict[14] = ["", [], []]
		character_dialogue_dict[15] = ["", [], []]
		character_dialogue_dict[16] = ["", [], []]
		
		# Depth 2
		player_dialogue_dict[0] = ["No, I actually haven't played since Iris and I were kids", 1, []]
		player_dialogue_dict[1] = ["Yeah, I remember.", 2, []]
		# Depth 4
		player_dialogue_dict[2] = ["Okay. Always hated the game, to be honest", 3, []]
		player_dialogue_dict[3] = ["Okay. I've missed playing this.", 4, []]
		player_dialogue_dict[4] = ["It's too easy. Not much of a challenge", 5, []]
		# Depth 6
		player_dialogue_dict[5] = ["I've never been too good at it. Iris was always better at it.", 6, []]
		player_dialogue_dict[6] = ["South?", 7, []]
		player_dialogue_dict[7] = ["Yeah. That's a nice way of putting it.", 8, []]
		# Depth 8
		player_dialogue_dict[8] = ["Is that what we're here to celebrate? Good fun?", 9, []]
		player_dialogue_dict[9] = ["Yeah, you're right. She would have liked this.", -1, []]
		player_dialogue_dict[10] = ["Yeah ... I miss her. What happened anyway?", 11, []]
		player_dialogue_dict[11] = ["No, I don't, Peter. You're gonna have to remind me.", 12, []]
		player_dialogue_dict[12] = ["Peter ... I know.", 10, []]
		player_dialogue_dict[13] = ["I just want to know what happened to my sister.", 14, []]
		# Depth 10
		player_dialogue_dict[14] = ["Did you think her murder was 'good fun?'", 15, []]
		player_dialogue_dict[15] = ["I just wouldn't call this 'good fun.'", 16, []]
		player_dialogue_dict[16] = ["One of them killed her ... didn't they?", 17, []]
		player_dialogue_dict[17] = ["You're the eyes and ears around here. You must have heard something.", -1, []]
		
	elif character == "amity":
		# Depth 1
		character_dialogue_dict["1a"] = ["Hello Jack. It's nice to meet you", ["1a", "1b"], []]
		# Depth 3
		character_dialogue_dict["2a"] = ["Funny.", ["2a", "2b"], []]
		character_dialogue_dict["2b"] = ["You know how to play?", ["2c", "2d"], []]
		# Depth 5
		character_dialogue_dict["3a"] = ["No, not really.", ["3a", "3b"], []]
		character_dialogue_dict["3b"] = ["Not very hard, I see.", ["3c", "3d"], []]
		character_dialogue_dict["3d"] = ["How's the little guy doin'?", ["3e", "3f"], []]
		character_dialogue_dict["3c"] = ["we'll see.", ["3g", "3h"], []]
		# Depth 7
		character_dialogue_dict["4a"] = ["Why are you here, detective?", ["4a", "4b"], []]
		character_dialogue_dict["4b"] = ["Sorry, didn't mean to hurt your feelings.", ["4c", "4d"], []]
		character_dialogue_dict["4c"] = ["Can't wait.", ["4e", "4f"], []]
		character_dialogue_dict["4d"] = ["Iris said you always made her laugh. When you were kids, anyway.", ["4g", "4h"], []]
		character_dialogue_dict["4e"] = ["Relax, I was just curious.", ["4i", "4j"], []]
		character_dialogue_dict["4f"] = ["Yes. Other than that.", ["4k", "4l"], []]
		character_dialogue_dict["4g"] = ["When did you and Iris start playing?", ["4m", "4n"], []]
		character_dialogue_dict["4h"] = ["Haha, you shouldn't have told me that.", ["4o", "4p"], []]
		# Depth 9
		character_dialogue_dict["5a"] = ["To pay your respects?", ["5a", "5b"], []]
		character_dialogue_dict["5b"] = ["Of course ... because the last 15 years have been all about respect.", ["5c", "5d"], []]
		character_dialogue_dict["5c"] = ["", ["5e", "5f"], []]
		character_dialogue_dict["5d"] = ["I know.", ["5g", "5h"], []]
		character_dialogue_dict["5e"] = ["", ["5i", "5j"], []]
		character_dialogue_dict["5f"] = ["", ["5k", "5l"], []]
		character_dialogue_dict["5g"] = ["", ["5m", "5n"], []]
		character_dialogue_dict["5h"] = ["Well, she always made me laugh.", ["5o", "5p"], []]
		character_dialogue_dict["5i"] = ["", ["5q", "5r"], []]
		character_dialogue_dict["5j"] = ["", ["5s", "5t"], []]
		character_dialogue_dict["5k"] = ["", ["5u", "5v"], []]
		character_dialogue_dict["5l"] = ["", ["5w", "5x"], []]
		character_dialogue_dict["5m"] = ["", ["5y", "5z"], []]
		character_dialogue_dict["5n"] = ["", ["5aa", "5ab"], []]
		character_dialogue_dict["5o"] = ["You have nothing to fear.", ["5ac", "5ad"], []]
		character_dialogue_dict["5p"] = ["", ["5ae", "5af"], []]
		# Depth 11
		
		# Depth 2
		player_dialogue_dict["1a"] = ["We've actually met before. Just not officially.", "2a", ["+stress"]]
		player_dialogue_dict["1b"] = ["Likewise.", "2b", ["-stress"]]
		# Depth 4
		player_dialogue_dict["2a"] = ["Was it?", "3a", ["+stress"]]
		player_dialogue_dict["2b"] = ["Thanks, I try.", "3b", ["-stress"]]
		player_dialogue_dict["2c"] = ["Peter just gave me a refresher course.", "3c", ["+stress"]]
		player_dialogue_dict["2d"] = ["Of course.", "3d", ["-stress"]]
		# Depth 6
		player_dialogue_dict["3a"] = ["Well it wasn't mean to be.", "4a", ["+stress"]]
		player_dialogue_dict["3b"] = ["Ouch.", "4b", ["-stress"]]
		player_dialogue_dict["3c"] = ["Eh, just give me a few minutes.", "4c", ["+stress"]]
		player_dialogue_dict["3d"] = ["Ouch.", "4d", ["-stress"]]
		player_dialogue_dict["3e"] = ["Why don't you ask him yourself?", "4e", ["+stress"]]
		player_dialogue_dict["3f"] = ["Other than his best friend dying?", "4f", ["+stress"]]
		player_dialogue_dict["3g"] = ["Mmhmm.", "4g", ["+stress"]]
		player_dialogue_dict["3h"] = ["I'm still a little rusty.", "4h", ["-stress"]]
		# Depth 8
		player_dialogue_dict["4a"] = ["You know why I'm here.", "5a", ["+stress"]]
		player_dialogue_dict["4b"] = ["I just wanted to pay my respects.", "5b", ["-stress"]]
		player_dialogue_dict["4c"] = ["Yes you did.", "5c", ["+stress"]]
		player_dialogue_dict["4d"] = ["You're so kind.", "5d", ["-stress"]]
		player_dialogue_dict["4e"] = ["", "5e", ["+stress"]]
		player_dialogue_dict["4f"] = ["", "5f", ["+stress"]]
		player_dialogue_dict["4g"] = ["Well then she has a better memory than me.", "5g", ["+stress"]]
		player_dialogue_dict["4h"] = ["Really? In my head it's the other way around.", "5h", ["-stress"]]
		player_dialogue_dict["4i"] = ["", "5a", ["+stress"]]
		player_dialogue_dict["4j"] = ["", "5b", ["-stress"]]
		player_dialogue_dict["4k"] = ["", "5c", ["+stress"]]
		player_dialogue_dict["4l"] = ["", "5d", ["-stress"]]
		player_dialogue_dict["4m"] = ["", "5e", ["+stress"]]
		player_dialogue_dict["4n"] = ["", "5f", ["-stress"]]
		player_dialogue_dict["4o"] = ["I'm terrified.", "5g", ["+stress"]]
		player_dialogue_dict["4p"] = ["I was gonna let you win anyway.", "5h", ["-stress"]]
		# Depth 10
		player_dialogue_dict["5a"] = ["No.", "", ["+stress"]]
		player_dialogue_dict["5b"] = ["Sure, Amity, let's call it that", "", ["-stress"]]
		player_dialogue_dict["5c"] = ["They were, depending on your point of view.", "", ["+stress"]]
		player_dialogue_dict["5d"] = ["I was just doing my job.", "", ["-stress"]]
		player_dialogue_dict["5e"] = ["", "", ["+stress"]]
		player_dialogue_dict["5f"] = ["", "", ["+stress"]]
		player_dialogue_dict["5g"] = ["", "", ["+stress"]]
		player_dialogue_dict["5h"] = ["And so humble!", "", ["-stress"]]
		player_dialogue_dict["5i"] = ["", "", ["+stress"]]
		player_dialogue_dict["5j"] = ["", "", ["-stress"]]
		player_dialogue_dict["5k"] = ["", "", ["+stress"]]
		player_dialogue_dict["5l"] = ["", "", ["-stress"]]
		player_dialogue_dict["5m"] = ["", "", ["+stress"]]
		player_dialogue_dict["5n"] = ["", "", ["-stress"]]
		player_dialogue_dict["5o"] = ["Always?", "", ["+stress"]]
		player_dialogue_dict["5p"] = ["She had that effect on people.", "", ["-stress"]]
		player_dialogue_dict["5q"] = ["", "", ["+stress"]]
		player_dialogue_dict["5r"] = ["", "", ["-stress"]]
		player_dialogue_dict["5s"] = ["", "", ["+stress"]]
		player_dialogue_dict["5t"] = ["", "", ["-stress"]]
		player_dialogue_dict["5u"] = ["", "", ["+stress"]]
		player_dialogue_dict["5v"] = ["", "", ["+stress"]]
		player_dialogue_dict["5w"] = ["", "", ["+stress"]]
		player_dialogue_dict["5x"] = ["", "", ["-stress"]]
		player_dialogue_dict["5y"] = ["", "", ["+stress"]]
		player_dialogue_dict["5z"] = ["", "", ["-stress"]]
		player_dialogue_dict["5aa"] = ["", "", ["+stress"]]
		player_dialogue_dict["5ab"] = ["", "", ["-stress"]]
		player_dialogue_dict["5ac"] = ["You sure about that?", "", ["+stress"]]
		player_dialogue_dict["5ad"] = ["", "", ["-stress"]]
		player_dialogue_dict["5ae"] = ["", "", ["+stress"]]
		player_dialogue_dict["5af"] = ["", "", ["-stress"]]
		# Depth 12
		player_dialogue_dict["6a"] = ["I'm looking for someone.", "", ["+stress"]]
		player_dialogue_dict["6b"] = ["...", "", ["-stress"]]
		player_dialogue_dict["6c"] = ["No.", "", ["+stress"]]
		player_dialogue_dict["6d"] = ["At some point, maybe I did.", "", ["-stress"]]
	
func playDialogue(key):
	# Erase old prompt
	if current_prompt != null:
		current_prompt.queue_free()
	# Erase old options
	while not(current_options.is_empty()):
		var prompt = current_options.pop_front()
		prompt.queue_free()
	# Lookup prompt string
	var prompt_text = Global.character_dialogue_dict[key][0]
	var prompt_size = len(prompt_text)
	# Lookup options array
	var options = Global.character_dialogue_dict[key][1]
	# Lookup actions array
	var actions = Global.character_dialogue_dict[key][2]
	# Create visual prompt
	current_prompt = dialogueBox.instantiate()
	current_prompt.position = Vector2(100, 100)
	current_prompt.get_node("Text").text = "[center]" + prompt_text + "[/center]"
	# Update text size to fit box (have to do in a roundabout way because there is no way to scale font size
	# differently for two labels displayed simultaneously)
	#resize_text(current_prompt.get_node("Text"), prompt_size)
	get_tree().get_root().add_child(current_prompt) # adding to main
	# hide until push gage fills
	if key != "1a":
		current_prompt.hide()

	# Create visual options
	var num_options = len(options)
	for i in num_options:
		# Lookup option string
		var option_text = Global.player_dialogue_dict[options[i]][0]
		var option_size = len(option_text)
		# Lookup prompts key (option outcomes)
		var prompt = Global.player_dialogue_dict[options[i]][1]
		# Lookup actions array
		var option_actions = Global.player_dialogue_dict[options[i]][2]
		# Create visual prompt
		var new_option = dialogueOption.instantiate()
		new_option.position = Vector2((1920/(1 + num_options))*(i + 1) - 215, 500)
		new_option.get_node("Text").text = "[center]" + option_text + "[/center]"
		# Update text size to fit box
		#resize_text(new_option.get_node("Text"), option_size)
		# Assign the outcome to be triggered on button press
		new_option.outcome = prompt # here we assign the outcome to be triggered on button press
		new_option.actions = option_actions
		# Complete process
		current_options.append(new_option) # Store as current option
		get_tree().get_root().add_child(new_option) # adding to main
		# Hide until push gauge fills
		if key != "1a" and key != "1b":
			new_option.hide()
		
"""
* this function scales a text box to fit within a DialogueOption or DialogueBox object
* param: textBox: the text box object
* param: char_count: the number of (visible) characters in the text string being displayed by the textBox
"""
func resize_text(textBox, char_count):
	# Determine how many resizings must be performed based on number of characters in text string
	var scale_level = 0
	if char_count > 10:
		scale_level+=1
	if char_count > 20:
		scale_level+=1
	if char_count > 40:
		scale_level+=1
	# Reduce scale to give the appearance of shrinking text
	textBox.scale = textBox.scale * pow(0.75, scale_level)
	# Increase size of textBox rect to counteract reduced scale
	textBox.size = textBox.size * pow(1.25, scale_level)
	# Increase x origin of textBox rect to counteract reduced scale
	textBox.position.x = textBox.position.x * pow(1.5, scale_level)
	# Reduce y origin of textBox rect to utilize space above the center of the DialogueBox or DialogueOption
	textBox.position.y = textBox.position.y * pow(0.9, scale_level)
