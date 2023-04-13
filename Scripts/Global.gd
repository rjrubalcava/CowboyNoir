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
		character_dialogue_dict["211a"] = ["", ["111a", "111b"], []]
		character_dialogue_dict["212a"] = ["", ["111a", "111b"], []]
		character_dialogue_dict["212b"] = ["", ["111a", "111b"], []]
		# Tree 2:
		character_dialogue_dict["221a"] = ["", ["111a", "111b"], []]
		character_dialogue_dict["222a"] = ["", ["111a", "111b"], []]
		character_dialogue_dict["222b"] = ["", ["111a", "111b"], []]
		### stage 3 ###
		# Tree 1:
		character_dialogue_dict["311a"] = ["", ["111a", "111b"], []]
		character_dialogue_dict["312a"] = ["", ["111a", "111b"], []]
		character_dialogue_dict["312b"] = ["", ["111a", "111b"], []]
		# Tree 2:
		character_dialogue_dict["321a"] = ["", ["111a", "111b"], []]
		character_dialogue_dict["322a"] = ["", ["111a", "111b"], []]
		character_dialogue_dict["322b"] = ["", ["111a", "111b"], []]
		# Tree 3:
		character_dialogue_dict["331a"] = ["", ["111a", "111b"], []]
		character_dialogue_dict["332a"] = ["", ["111a", "111b"], []]
		character_dialogue_dict["33b"] = ["", ["111a", "111b"], []]
		# Tree 4:
		character_dialogue_dict["341a"] = ["", ["111a", "111b"], []]
		character_dialogue_dict["342a"] = ["", ["111a", "111b"], []]
		character_dialogue_dict["342b"] = ["", ["111a", "111b"], []]
		### stage 4 ###
		# Tree 1:
		character_dialogue_dict["411a"] = ["", ["111a", "111b"], []]
		character_dialogue_dict["412a"] = ["", ["111a", "111b"], []]
		character_dialogue_dict["412b"] = ["", ["111a", "111b"], []]
		# Tree 2:
		character_dialogue_dict["421a"] = ["", ["111a", "111b"], []]
		character_dialogue_dict["422a"] = ["", ["111a", "111b"], []]
		character_dialogue_dict["422b"] = ["", ["111a", "111b"], []]
		# Tree 3:
		character_dialogue_dict["431a"] = ["", ["111a", "111b"], []]
		character_dialogue_dict["432a"] = ["", ["111a", "111b"], []]
		character_dialogue_dict["432b"] = ["", ["111a", "111b"], []]
		# Tree 4:
		character_dialogue_dict["441a"] = ["", ["111a", "111b"], []]
		character_dialogue_dict["442a"] = ["", ["111a", "111b"], []]
		character_dialogue_dict["442b"] = ["", ["111a", "111b"], []]
		##### END ######
		
		###### PLAYER ######
		### stage 1 ###
		# Tree 1:
		player_dialogue_dict["111a"] = ["We've met before.", "112a", []]
		player_dialogue_dict["111b"] = ["Likewise.", "112b", []]
		player_dialogue_dict["112a"] = ["Well, you haven't met me yet.", "", ["increase"]]
		player_dialogue_dict["112b"] = ["Yeah, just a few times.", "", ["neutral"]]
		player_dialogue_dict["112c"] = ["Of course.", "", ["increase"]]
		player_dialogue_dict["112d"] = ["Yeah, I might be a little rusty.", "", ["neutral"]]
		### stage 2 ###
		# Tree 1:
		player_dialogue_dict["211a"] = ["We've met before.", "212a", []]
		player_dialogue_dict["211b"] = ["Likewise.", "212b", []]
		player_dialogue_dict["212a"] = ["We've met before.", "", ["increase"]]
		player_dialogue_dict["212b"] = ["Likewise.", "", ["neutral"]]
		player_dialogue_dict["212c"] = ["We've met before.", "", ["increase"]]
		player_dialogue_dict["212d"] = ["Likewise.", "", ["neutral"]]
		# Tree 2:
		player_dialogue_dict["221a"] = ["We've met before.", "222a", []]
		player_dialogue_dict["221b"] = ["Likewise.", "222b", []]
		player_dialogue_dict["222a"] = ["We've met before.", "", ["increase"]]
		player_dialogue_dict["222b"] = ["Likewise.", "", ["neutral"]]
		player_dialogue_dict["222c"] = ["We've met before.", "112a", ["increase"]]
		player_dialogue_dict["222d"] = ["Likewise.", "", ["neutral"]]
		### stage 3 ###
		# Tree 1:
		player_dialogue_dict["311a"] = ["We've met before.", "112a", []]
		player_dialogue_dict["311b"] = ["Likewise.", "112b", []]
		player_dialogue_dict["312a"] = ["We've met before.", "", ["increase"]]
		player_dialogue_dict["312b"] = ["Likewise.", "", ["neutral"]]
		player_dialogue_dict["312c"] = ["We've met before.", "", ["increase"]]
		player_dialogue_dict["312d"] = ["Likewise.", "", ["neutral"]]
		# Tree 2:
		player_dialogue_dict["321a"] = ["We've met before.", "112a", []]
		player_dialogue_dict["321b"] = ["Likewise.", "112b", []]
		player_dialogue_dict["322a"] = ["We've met before.", "", ["increase"]]
		player_dialogue_dict["322b"] = ["Likewise.", "", ["neutral"]]
		player_dialogue_dict["322c"] = ["We've met before.", "", ["increase"]]
		player_dialogue_dict["322d"] = ["Likewise.", "", ["neutral"]]
		# Tree 3:
		player_dialogue_dict["331a"] = ["We've met before.", "112a", []]
		player_dialogue_dict["331b"] = ["Likewise.", "112b", []]
		player_dialogue_dict["332a"] = ["We've met before.", "", ["increase"]]
		player_dialogue_dict["332b"] = ["Likewise.", "", ["neutral"]]
		player_dialogue_dict["332c"] = ["We've met before.", "", ["increase"]]
		player_dialogue_dict["332d"] = ["Likewise.", "", ["neutral"]]
		# Tree 4:
		player_dialogue_dict["341a"] = ["We've met before.", "112a", []]
		player_dialogue_dict["341b"] = ["Likewise.", "112b", []]
		player_dialogue_dict["342a"] = ["We've met before.", "", ["increase"]]
		player_dialogue_dict["342b"] = ["Likewise.", "", ["neutral"]]
		player_dialogue_dict["342c"] = ["We've met before.", "", ["increase"]]
		player_dialogue_dict["342d"] = ["Likewise.", "", ["neutral"]]
		### stage 4 ###
		# Tree 1:
		player_dialogue_dict["411a"] = ["We've met before.", "112a", []]
		player_dialogue_dict["411b"] = ["Likewise.", "112b", []]
		player_dialogue_dict["412a"] = ["We've met before.", "", ["increase"]]
		player_dialogue_dict["412b"] = ["Likewise.", "", ["neutral"]]
		player_dialogue_dict["412c"] = ["We've met before.", "", ["increase"]]
		player_dialogue_dict["412d"] = ["Likewise.", "", ["neutral"]]
		# Tree 2:
		player_dialogue_dict["421a"] = ["We've met before.", "112a", []]
		player_dialogue_dict["421b"] = ["Likewise.", "112b", []]
		player_dialogue_dict["422a"] = ["We've met before.", "", ["increase"]]
		player_dialogue_dict["422b"] = ["Likewise.", "", ["neutral"]]
		player_dialogue_dict["422c"] = ["We've met before.", "", ["increase"]]
		player_dialogue_dict["422d"] = ["Likewise.", "", ["neutral"]]
		# Tree 3:
		player_dialogue_dict["431a"] = ["We've met before.", "112a", []]
		player_dialogue_dict["431b"] = ["Likewise.", "112b", []]
		player_dialogue_dict["432a"] = ["We've met before.", "", ["increase"]]
		player_dialogue_dict["432b"] = ["Likewise.", "", ["neutral"]]
		player_dialogue_dict["432c"] = ["We've met before.", "", ["increase"]]
		player_dialogue_dict["432d"] = ["Likewise.", "", ["neutral"]]
		# Tree 4:
		player_dialogue_dict["441a"] = ["We've met before.", "112a", []]
		player_dialogue_dict["441b"] = ["Likewise.", "112b", []]
		player_dialogue_dict["442a"] = ["We've met before.", "", ["increase"]]
		player_dialogue_dict["442b"] = ["Likewise.", "", ["neutral"]]
		player_dialogue_dict["442c"] = ["We've met before.", "", ["increase"]]
		player_dialogue_dict["442d"] = ["Likewise.", "", ["neutral"]]
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
	# hide until push gage fills
	if key != "111a":
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
		if key != "111a" and key != "111b":
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
