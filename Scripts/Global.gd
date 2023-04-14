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
	if character ==  "amity":
		###### AMITY ######
		### stage 1 ###
		# Tree 1:
		character_dialogue_dict["111a"] = ["Hello Jack. It's nice to meet you.", ["111a", "111b"], []]
		character_dialogue_dict["112a"] = ["We have?", ["112a", "112b"], []]
		character_dialogue_dict["112b"] = ["You remember how to play?", ["112c", "112d"], []]
		### stage 2 ###
		# Tree 1:
		character_dialogue_dict["211a"] = ["Are you gonna tell me why you're here, detective?", ["211a", "211b"], []]
		character_dialogue_dict["212a"] = ["I want to hear it from you.", ["212a", "212b"], []]
		character_dialogue_dict["212b"] = ["Funny, didn't think you ever respected Iris.", ["212c", "212d"], []]
		# Tree 2:
		character_dialogue_dict["221a"] = ["Did you ever play with Iris?", ["221a", "221b"], []]
		character_dialogue_dict["222a"] = ["Figures.", ["222a", "222b"], []]
		character_dialogue_dict["222b"] = ["Hmm ... different time.", ["222c", "222d"], []]
		### stage 3 ###
		# Tree 1:
		character_dialogue_dict["311a"] = ["Enlighten me.", ["311a", "311b"], []]
		character_dialogue_dict["312a"] = ["Sorry, I must've confused 'respect' with misguided vendetta.", ["312a", "312b"], []]
		character_dialogue_dict["312b"] = ["You've been practically strangers for 15 years.", ["312c", "312d"], []]
		# Tree 2:
		character_dialogue_dict["321a"] = ["Me too ...", ["321a", "321b"], []]
		character_dialogue_dict["322a"] = ["Why should I?", ["322a", "322b"], []]
		character_dialogue_dict["322b"] = ["Do you have any other options?", ["322c", "322d"], []]
		# Tree 3:
		character_dialogue_dict["331a"] = ["How dare you?", ["331a", "331b"], []]
		character_dialogue_dict["332a"] = ["I'm not gonna let you interrogate me.", ["332a", "332b"], []]
		character_dialogue_dict["332b"] = ["Nothing, other than he's in charge now.", ["332c", "332d"], []]
		# Tree 4:
		character_dialogue_dict["341a"] = ["", ["341a", "341b"], []]
		character_dialogue_dict["342a"] = ["", ["342a", "342b"], []]
		character_dialogue_dict["342b"] = ["", ["342c", "342d"], []]
		### stage 4 ###
		# Tree 1:
		character_dialogue_dict["411a"] = ["What does Peter have to do with this?", ["411a", "411b"], []]
		character_dialogue_dict["412a"] = ["There's no one you can trust.", ["412a", "412b"], []]
		character_dialogue_dict["412b"] = ["He's going to get himself killed.", ["412a", "412b"], []]
		# Tree 2:
		character_dialogue_dict["421a"] = ["She didn't have a choice.", ["421a", "421b"], []]
		character_dialogue_dict["422a"] = ["Stan was also her family. She couldn't throw that away as easy as you.", ["422a", "422b"], []]
		character_dialogue_dict["422b"] = ["And you do?", ["422a", "422b"], []]
		# Tree 3:
		character_dialogue_dict["431a"] = ["Doesn't matter anymore. You're too late.", ["431a", "431b"], []]
		character_dialogue_dict["432a"] = ["Well, don't say I didn't warn you.", ["432a", "432b"], []]
		character_dialogue_dict["432b"] = ["I don't [i]need[/i] to do anything.", ["432a", "432b"], []]
		# Tree 4:
		character_dialogue_dict["441a"] = ["You really have no idea what you're doing.", ["441a", "441b"], []]
		character_dialogue_dict["442a"] = ["Neither was Iris, and you didn't care.", ["442a", "442b"], []]
		character_dialogue_dict["442b"] = ["You've already proven me right.", ["442a", "442b"], []]
		##### END ######
		
		###### PLAYER ######
		### stage 1 ###
		# Tree 1:
		player_dialogue_dict["111a"] = ["We've met before.", "112a", []]
		player_dialogue_dict["111b"] = ["Likewise.", "112b", []]
		player_dialogue_dict["112a"] = ["Well, you haven't met me yet.", "211a", ["increase"]]
		player_dialogue_dict["112b"] = ["Yeah, just a few times.", "221a", ["neutral"]]
		player_dialogue_dict["112c"] = ["Of course.", "211a", ["increase"]]
		player_dialogue_dict["112d"] = ["Yeah, I might be a little rusty.", "221a", ["neutral"]]
		### stage 2 ###
		# Tree 1:
		player_dialogue_dict["211a"] = ["You know why I'm here, Amity.", "212a", []]
		player_dialogue_dict["211b"] = ["Just trying to pay my respects.", "212b", []]
		player_dialogue_dict["212a"] = ["I'm here to find my sister's killer.", "321a", ["increase"]]
		player_dialogue_dict["212b"] = ["I don't owe you anything.", "331a", ["neutral"]]
		player_dialogue_dict["212c"] = ["I've respected her my entire life.", "321a", ["increase"]]
		player_dialogue_dict["212d"] = ["You clearly didn't know me very well.", "311a", ["neutral"]]
		# Tree 2:
		player_dialogue_dict["221a"] = ["I don't remember.", "222a", []]
		player_dialogue_dict["221b"] = ["Yeah, when we were kids.", "222b", []]
		player_dialogue_dict["222a"] = ["I didn't come here for some game, I came for Iris.", "321a", ["increase"]]
		player_dialogue_dict["222b"] = ["I've made some mistakes. That's why I'm here.", "331a", ["neutral"]]
		player_dialogue_dict["222c"] = ["I only see one big difference.", "321a", ["increase"]]
		player_dialogue_dict["222d"] = ["She chose this life.", "331a", ["neutral"]]
		### stage 3 ###
		# Tree 1:
		player_dialogue_dict["311a"] = ["I wouldn't waste my time investigating someone I didn't respect.", "312a", []]
		player_dialogue_dict["311b"] = ["She was my sister. I knew her better than you did.", "312b", []]
		player_dialogue_dict["312a"] = ["She could have gone with me. She didn't need to live this way.", "421a", ["increase"]]
		player_dialogue_dict["312b"] = ["Why would I ever want to investigate my sister?", "441a", []]
		player_dialogue_dict["312c"] = ["Fine, if you're not going to help me, I'll just talk to Peter.", "411a", ["increase"]]
		player_dialogue_dict["312d"] = ["That wasn't what I wanted.", "441a", []]
		# Tree 2:
		player_dialogue_dict["321a"] = ["Are you going to help me, or not?", "322a", []]
		player_dialogue_dict["321b"] = ["Why should I trust you?", "322b", []]
		player_dialogue_dict["322a"] = ["I thought you'd want to help me.", "431a", ["increase"]]
		player_dialogue_dict["322b"] = ["I need your help.", "441a", ["neutral"]]
		player_dialogue_dict["322c"] = ["Peter.", "411a", ["increase"]]
		player_dialogue_dict["322d"] = ["No.", "441a", ["neutral"]]
		# Tree 3:
		player_dialogue_dict["331a"] = ["How was your relationship with Iris?", "332a", []]
		player_dialogue_dict["331b"] = ["What can you tell me about Gila?", "332b", []]
		player_dialogue_dict["332a"] = ["I thought you'd want to help me.", "", ["increase"]]
		player_dialogue_dict["332b"] = ["I need your help.", "441a", ["neutral"]]
		player_dialogue_dict["332c"] = ["How do you feel about that?", "", ["increase"]]
		player_dialogue_dict["332d"] = ["He have anything against Iris?", "441a", ["neutral"]]
		# Tree 4:
		player_dialogue_dict["341a"] = ["", "342a", []]
		player_dialogue_dict["341b"] = ["", "342b", []]
		player_dialogue_dict["342a"] = ["", "", ["increase"]]
		player_dialogue_dict["342b"] = ["", "", ["neutral"]]
		player_dialogue_dict["342c"] = ["", "", ["increase"]]
		player_dialogue_dict["342d"] = ["", "", ["neutral"]]
		### stage 4 ###
		# Tree 1:
		player_dialogue_dict["411a"] = ["He's the only one here I might be able to trust.", "412a", []]
		player_dialogue_dict["411b"] = ["I'm not sure yet.", "412b", []]
		player_dialogue_dict["412a"] = ["Peter said the same thing.", "", ["increase"]]
		player_dialogue_dict["412b"] = ["You can make the choice to change that.", "", ["neutral"]]
		player_dialogue_dict["412c"] = ["Then he's braver than you.", "", ["increase"]]
		player_dialogue_dict["412d"] = ["I can protect you both.", "", ["neutral"]]
		# Tree 2:
		player_dialogue_dict["421a"] = ["If I had a choice, then she had a choice.", "422a", []]
		player_dialogue_dict["421b"] = ["You don't know that.", "422b", []]
		player_dialogue_dict["422a"] = ["What makes you think it was easy?", "", ["increase"]]
		player_dialogue_dict["422b"] = ["She would have had me.", "", ["neutral"]]
		player_dialogue_dict["422c"] = ["Yes.", "", ["increase"]]
		player_dialogue_dict["422d"] = ["I thought I did.", "", ["neutral"]]
		# Tree 3:
		player_dialogue_dict["431a"] = ["I'm not just going to give up.", "432a", []]
		player_dialogue_dict["431b"] = ["I know it was someone here. You need to tell me who.", "432b", []]
		player_dialogue_dict["432a"] = ["Don't you want to clear your name?", "", ["increase"]]
		player_dialogue_dict["432b"] = ["Whoever you're scared of, I can protect you.", "", ["neutral"]]
		player_dialogue_dict["432c"] = ["Don't you want to clear your name?", "", ["increase"]]
		player_dialogue_dict["432d"] = ["No ... but you should [i]want[/i] to.", "", ["neutral"]]
		# Tree 4:
		player_dialogue_dict["441a"] = ["I'm here to help you. You're not safe here.", "442a", []]
		player_dialogue_dict["441b"] = ["Let me prove you wrong.", "442b", []]
		player_dialogue_dict["442a"] = ["...", "", ["neutral"]]
		player_dialogue_dict["442b"] = ["What?!", "", ["neutral"]]
		player_dialogue_dict["442c"] = ["...", "", ["neutral"]]
		player_dialogue_dict["442d"] = ["What?!", "", ["neutral"]]
		##### END ######
		
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
		
"""
* this function scales a text box to fit within a DialogueOption or DialogueBox object
* param: textBox: the text box object
* param: char_count: the number of (visible) characters in the text string being displayed by the textBox
"""
func resize_text(textBox, char_count):
	# Determine how many resizings must be performed based on number of characters in text string
	var scale_level = 0
	var rise_level = 0
	if char_count > 9:
		scale_level+=1
	if char_count > 18:
		scale_level+=1
	if char_count > 36:
		scale_level+=1
	if char_count > 11:
		rise_level+=3
	if char_count > 15:
		rise_level+=5
	if char_count > 36:
		rise_level+=12
	# Reduce scale to give the appearance of shrinking text
	textBox.scale = textBox.scale * pow(0.85, scale_level)
	# Increase size of textBox rect to counteract reduced scale
	textBox.size = textBox.size * pow(1.15, scale_level)
	# Reduce y origin of textBox rect to utilize space above the center of the DialogueBox or DialogueOption
	textBox.position.y = textBox.position.y - rise_level
