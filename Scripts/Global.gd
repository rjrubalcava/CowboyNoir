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
		character_dialogue_dict["1a"] = ["Hello Jack. It's nice to meet you.", ["1a", "1b"], []]
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
		character_dialogue_dict["6a"] = ["What then?", ["6a", "6b"], []]
		character_dialogue_dict["6b"] = ["What? You didn't respect your own family?", ["6c", "6d"], []]
		# Depth 13
		character_dialogue_dict["7a"] = ["You'll have to be more specific, detective.", ["7a", "7b"], []]
		character_dialogue_dict["7b"] = ["Just to mock us?", ["7c", "7d"], []]
		# Depth 15
		character_dialogue_dict["8a"] = ["How dare _you_! Showing up like this.", ["8a", "8b"], []]
		character_dialogue_dict["8b"] = ["We both know you never cared about her. Who knows? Maybe you killed her.", ["8c", "8d"], []]
		# Depth 17
		character_dialogue_dict["9a"] = ["Are you sure about that? Because this feels personal.", ["9a", "9b"], []]
		character_dialogue_dict["9b"] = ["What the hell is that supposed to mean?!", ["9c", "9d"], []]
		# Depth 19
		character_dialogue_dict["10a"] = ["Thought cops weren't supposed to mix work and personal life.", ["10a", "10b"], []]
		character_dialogue_dict["10b"] = ["It was always personal. She's your sister, what did you expect?", ["10c", "10d"], []]
		# Depth 21
		character_dialogue_dict["11a"] = ["It doesn't matter anymore.", ["11a", "11b"], []]
		# Depth 23
		character_dialogue_dict["12a"] = ["If anything you should be happy. You finally got what you wanted.", ["12a", "12b"], []]
		# Depth 25
		character_dialogue_dict["13a"] = ["Could have fooled me.", ["13a", "13b"], []]
		# Depth 27
		character_dialogue_dict["14a"] = ["Of course!", ["14a", "14b"], []]
		# Depth 29
		character_dialogue_dict["15a"] = ["Why should I?", ["15a", "15b"], []]
		# Depth 31
		character_dialogue_dict["16a"] = ["Well I want you dead, so I'm not sure I'm following.", ["16a", "16b"], []]
		# Depth 33
		character_dialogue_dict["17a"] = ["How do you know what I want?", ["17a", "17b"], []]
		# Depth 35
		character_dialogue_dict["18a"] = ["I don't know that. Matter of fact I don't know you at all.", ["18a", "18b"], []]
		# Depth 37
		character_dialogue_dict["19a"] = ["Not a big difference where I come from.", ["19a", "19b"], []]
		# Depth 39
		character_dialogue_dict["20a"] = ["...", ["20a", "20b"], []]
		# Depth 41
		character_dialogue_dict["21a"] = ["...", ["21a", "21b"], []]
		# Depth 43
		character_dialogue_dict["22a"] = ["Maybe ... it'd be suicide.", ["22a", "22b"], []]
		# Depth 45
		character_dialogue_dict["23a"] = ["You don't even know what that word means.", ["23a", "23b"], []]
		# Depth 47
		character_dialogue_dict["24a"] = ["All I can say is something Iris' car ... and a bomb.", ["24a", "24b"], []]
		# Depth 49
		character_dialogue_dict["25a"] = ["Gila.", ["25a", "25b"], []]
		
		# Depth 2
		player_dialogue_dict["1a"] = ["We've actually met before. Just not officially.", "2a", ["+stress"]]
		player_dialogue_dict["1b"] = ["Likewise.", "2b", ["-stress"]]
		# Depth 4
		player_dialogue_dict["2a"] = ["Was it?", "3a", ["+stress"]]
		player_dialogue_dict["2b"] = ["Thanks, I try.", "3b", ["-stress"]]
		player_dialogue_dict["2c"] = ["Peter just gave me a refresher course.", "3c", ["+stress"]]
		player_dialogue_dict["2d"] = ["Of course.", "3d", ["-stress"]]
		# Depth 6
		player_dialogue_dict["3a"] = ["Iris may have thought so.", "4a", ["+stress"]]
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
		player_dialogue_dict["5a"] = ["No.", "6a", ["+stress"]]
		player_dialogue_dict["5b"] = ["Sure, Amity, let's call it that", "6b", ["-stress"]]
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
		player_dialogue_dict["6a"] = ["I'm looking for someone.", "7a", ["+stress"]]
		player_dialogue_dict["6b"] = ["...", "7b", ["-stress"]]
		player_dialogue_dict["6c"] = ["No.", "", ["+stress"]]
		player_dialogue_dict["6d"] = ["At some point, maybe I did.", "", ["-stress"]]
		# Depth 14
		player_dialogue_dict["7a"] = ["", "", ["+stress"]]
		player_dialogue_dict["7b"] = ["", "", ["-stress"]]
		player_dialogue_dict["7c"] = ["How dare you!", "8a", ["+stress"]]
		player_dialogue_dict["7d"] = ["What?", "8b", ["-stress"]]
		# Depth 16
		player_dialogue_dict["8a"] = ["I'm doing my job.", "9a", ["+stress"]]
		player_dialogue_dict["8b"] = ["I didn't know what else to do.", "9b", ["-stress"]]
		player_dialogue_dict["8c"] = ["Maybe you did.", "", ["+stress"]]
		player_dialogue_dict["8d"] = ["She was my sister!", "", ["-stress"]]
		# Depth 18
		player_dialogue_dict["9a"] = ["Why can't it be a bit of both?", "10a", ["+stress"]]
		player_dialogue_dict["9b"] = ["I never meant for it to be personal.", "10b", ["-stress"]]
		# Depth 20
		player_dialogue_dict["10a"] = ["I've been mixing them my whole career. I'm not gonna stop now.", "", ["+stress"]]
		player_dialogue_dict["10b"] = ["Wish I learned that 15 years ago.", "", ["-stress"]]
		player_dialogue_dict["10c"] = ["She was also a criminal. That was her choice.", "11a", ["+stress"]]
		player_dialogue_dict["10d"] = ["I don't know.", "", ["-stress"]]
		# Depth 22
		player_dialogue_dict["11a"] = ["If anything, it matters more.", "12a", ["+stress"]]
		player_dialogue_dict["11b"] = ["", "", ["-stress"]]
		# Depth 24
		player_dialogue_dict["12a"] = ["I never wanted this!", "13a", ["+stress"]]
		player_dialogue_dict["12b"] = ["", "", ["-stress"]]
		# Depth 26
		player_dialogue_dict["13a"] = ["Did you love my sister?", "14a", ["+stress"]]
		player_dialogue_dict["13b"] = ["", "", ["-stress"]]
		# Depth 28
		player_dialogue_dict["14a"] = ["Then let's just stop and think for a second.", "15a", ["+stress"]]
		player_dialogue_dict["14b"] = ["", "", ["-stress"]]
		# Depth 30
		player_dialogue_dict["15a"] = ["Because we bot want the same thing.", "16a", ["+stress"]]
		player_dialogue_dict["15b"] = ["", "", ["-stress"]]
		# Depth 32
		player_dialogue_dict["16a"] = ["I'm not the one you want.", "17a", ["+stress"]]
		player_dialogue_dict["16b"] = ["", "", ["-stress"]]
		# Depth 34
		player_dialogue_dict["17a"] = ["You know I would never kill Iris.", "18a", ["+stress"]]
		player_dialogue_dict["17b"] = ["", "", ["-stress"]]
		# Depth 36
		player_dialogue_dict["18a"] = ["Imprisoning and killing aren't the same thing.", "19a", ["+stress"]]
		player_dialogue_dict["18b"] = ["", "", ["-stress"]]
		# Depth 38
		player_dialogue_dict["19a"] = ["Are you saying you _wouldn't_ rather Iris be in prison rather than be dead?", "20a", ["+stress"]]
		player_dialogue_dict["19b"] = ["", "", ["-stress"]]
		# Depth 40
		player_dialogue_dict["20a"] = ["If you really loved my sister you'd help me.", "21a", ["+stress"]]
		player_dialogue_dict["20b"] = ["", "", ["-stress"]]
		# Depth 42
		player_dialogue_dict["21a"] = ["And if you're anything like the woman I've investigated these last 15 years ... then you know something.", "22a", ["+stress"]]
		player_dialogue_dict["21b"] = ["", "", ["-stress"]]
		# Depth 44
		player_dialogue_dict["22a"] = ["Relax. You're safe.", "23a", ["+stress"]]
		player_dialogue_dict["22b"] = ["", "", ["-stress"]]
		# Depth 46
		player_dialogue_dict["23a"] = ["Look at me. What do you know?", "24a", ["+stress"]]
		player_dialogue_dict["23b"] = ["", "", ["-stress"]]
		# Depth 48
		player_dialogue_dict["24a"] = ["Give me a name.", "25", ["+stress"]]
		player_dialogue_dict["24b"] = ["", "", ["-stress"]]
		# Depth 50
		player_dialogue_dict["25a"] = ["", "", ["+stress"]]
		player_dialogue_dict["25b"] = ["", "", ["-stress"]]
		
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
	current_prompt.get_node("Text").text = "[center]" + prompt_text + "[/center]"
	# Assign image for opponent response box
	current_prompt.get_node("Texture").texture = preload("res://Assets/BunnyTable/Opponent Response Blank.png")
	# Update text size to fit box (have to do in a roundabout way because there is no way to scale font size
	# differently for two labels displayed simultaneously)
	resize_text(current_prompt.get_node("Text"), prompt_size)
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
		# Assign image for left vs right option
		if i % 2 == 0:
			# Select image
			new_option.get_node("LeftOpt").show()
			new_option.get_node("RightOpt").hide()
			# Set text
			new_option.get_node("LeftOpt").get_node("Text").text = "[center]" + option_text + "[/center]"
			# Update text size to fit box
			resize_text(new_option.get_node("LeftOpt").get_node("Text"), option_size)
		else:
			# Select image
			new_option.get_node("LeftOpt").hide()
			new_option.get_node("RightOpt").show()
			# Set text
			new_option.get_node("RightOpt").get_node("Text").text = "[center]" + option_text + "[/center]"
			# Update text size to fit box
			resize_text(new_option.get_node("RightOpt").get_node("Text"), option_size)
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
	if char_count > 9:
		scale_level+=1
	if char_count > 18:
		scale_level+=1
	if char_count > 36:
		scale_level+=1
	# Reduce scale to give the appearance of shrinking text
	textBox.scale = textBox.scale * pow(0.9, scale_level)
	# Increase size of textBox rect to counteract reduced scale
	textBox.size = textBox.size * pow(1.1, scale_level)
	# Reduce y origin of textBox rect to utilize space above the center of the DialogueBox or DialogueOption
	textBox.position.y = textBox.position.y * pow(0.99, scale_level)
