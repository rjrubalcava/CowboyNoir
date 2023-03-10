extends Node2D


# General vars
var rng

# Bluff vars
var m_parent = null
var m_numOfCPUs = null

var clubsArr = null
var diamondsArr = null
var heartsArr = null
var spadesArr = null

var firstCardSuit = null
var firstCard = null
var tempCard = null
var noNewCard = null


var playerHand = null
var cpuOneHand = null
var cpuTwoHand = null
var cpuThreeHand = null
var cpuFourHand = null
var centerHand = null

# Dialogue vars
@onready var dialogueBox = preload("res://Scenes/DialogueBox.tscn")
@onready var dialogueOption = preload("res://Scenes/DialogueOption.tscn")
var character_dialogue_dict = {}
var player_dialogue_dict = {}
var current_prompt = null
var current_options = []


# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	rng.randomize()
	pass # Replace with function body.

func newGame():
	clubsArr = [1,2,3,4,5,6,7,8,9,10,11,12,13]
	diamondsArr = [1,2,3,4,5,6,7,8,9,10,11,12,13]
	heartsArr = [1,2,3,4,5,6,7,8,9,10,11,12,13]
	spadesArr = [1,2,3,4,5,6,7,8,9,10,11,12,13]
	playerHand = []
	cpuOneHand = []
	cpuTwoHand = []
	cpuThreeHand = []
	cpuFourHand = []
	centerHand = []
	init_dialogue()

	if(m_numOfCPUs == 2):
		for x in 17:
			playerHand.append(getRandomCard())
			cpuOneHand.append(getRandomCard())
			cpuTwoHand.append(getRandomCard())
		playerHand.append(getRandomCard())
	elif(m_numOfCPUs == 3):
		for x in 13:
			playerHand.append(getRandomCard())
			cpuOneHand.append(getRandomCard())
			cpuTwoHand.append(getRandomCard())
			cpuThreeHand.append(getRandomCard())
	elif(m_numOfCPUs == 4):
		for x in 10:
			playerHand.append(getRandomCard())
			cpuOneHand.append(getRandomCard())
			cpuTwoHand.append(getRandomCard())
			cpuThreeHand.append(getRandomCard())
			cpuFourHand.append(getRandomCard())
		playerHand.append(getRandomCard())
		cpuOneHand.append(getRandomCard())



func getRandomCard():
	noNewCard = true
	while noNewCard:
		firstCardSuit = rng.randi_range(1, 4)
		firstCard = rng.randi_range(1, 13)
		if firstCardSuit == 1:
			if int(clubsArr[firstCard - 1]) == int(firstCard):
				clubsArr[firstCard - 1] = 'X'
				noNewCard = false
				tempCard = 'c' + str(firstCard)
		elif firstCardSuit == 2:
			if int(diamondsArr[firstCard - 1]) == int(firstCard):
				diamondsArr[firstCard - 1] = 'X'
				noNewCard = false
				tempCard = 'd' + str(firstCard)
		elif firstCardSuit == 3:
			if int(heartsArr[firstCard - 1]) == int(firstCard):
				heartsArr[firstCard - 1] = 'X'
				noNewCard = false
				tempCard = 'h' + str(firstCard)
		elif firstCardSuit == 4:
			if int(spadesArr[firstCard - 1]) == int(firstCard):
				spadesArr[firstCard - 1] = 'X'
				noNewCard = false
				tempCard = 's' + str(firstCard)
	return tempCard


func newNode(node, location, parent, scaleMult):
	var newNode = node.instantiate()
	parent.add_child(newNode)
	newNode.global_position = location
	newNode.scale *= scaleMult
	return newNode

func init_dialogue():
	character_dialogue_dict[0] = ["Been a while, kid ...", [0,1]]
	character_dialogue_dict[1] = ["What's the matter? Can't speak?", [2,3]]
	character_dialogue_dict[2] = ["Too long! Where you been?!", [4,5]]
	character_dialogue_dict[3] = ["I heard about Felecia ...", [6,7]]
	character_dialogue_dict[4] = ["I've missed ya kid! You and Felicia ... where's she?", [8,9]]
	character_dialogue_dict[5] = ["I heard she was in the hospital or something ...", []]
	character_dialogue_dict[6] = ["Heard she got her head hurt or something ...", []]
	player_dialogue_dict[0] = ["...", 1]
	player_dialogue_dict[1] = ["Sure has ...", 2]
	player_dialogue_dict[2] = ["...", 3]
	player_dialogue_dict[3] = ["Don't got much to say.", 4]
	player_dialogue_dict[4] = ["Just looking after Felicia.", 5]
	player_dialogue_dict[5] = ["Around.", 6]
	player_dialogue_dict[6] = ["What did you hear?", 7]
	player_dialogue_dict[7] = ["What about her?", 8]
	player_dialogue_dict[8] = ["Dead.", 7]
	player_dialogue_dict[9] = ["Left her at home, I've got my own business to take care of.", 8]
	
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
	# Lookup options key array
	var options = Global.character_dialogue_dict[key][1]
	# Create visual prompt
	current_prompt = dialogueBox.instantiate()
	current_prompt.position = Vector2(100, 100)
	current_prompt.get_node("Text").text = "[center]" + prompt_text + "[/center]"
	# Update text size to fit box
	if prompt_size > 10:
		current_prompt.get_node("Text").size = current_prompt.get_node("Text").size * 1.25
		current_prompt.get_node("Text").scale = current_prompt.get_node("Text").scale * 0.75
	if prompt_size > 20:
		current_prompt.get_node("Text").size = current_prompt.get_node("Text").size * 1.25
		current_prompt.get_node("Text").scale = current_prompt.get_node("Text").scale * 0.75
	if prompt_size > 40:
		current_prompt.get_node("Text").size = current_prompt.get_node("Text").size * 1.25
		current_prompt.get_node("Text").scale = current_prompt.get_node("Text").scale * 0.75
	get_tree().get_root().add_child(current_prompt) # adding to main
	# Create visual options
	var num_options = len(options)
	for i in num_options:
		# Lookup option string
		var option_text = Global.player_dialogue_dict[options[i]][0]
		var option_size = len(option_text)
		# Lookup prompts key (option outcomes)
		var prompt = Global.player_dialogue_dict[options[i]][1]
		# Create visual prompt
		var new_option = dialogueOption.instantiate()
		new_option.position = Vector2((1920/(1 + num_options))*(i + 1) - 215, 500)
		new_option.get_node("Text").text = "[center]" + option_text + "[/center]"
		# Update text size to fit box
		if option_size > 10:
			new_option.get_node("Text").size = new_option.get_node("Text").size * 1.25
			new_option.get_node("Text").scale = new_option.get_node("Text").scale * 0.75
		if option_size > 20:
			new_option.get_node("Text").size = new_option.get_node("Text").size * 1.25
			new_option.get_node("Text").scale = new_option.get_node("Text").scale * 0.75
		if option_size > 40:
			new_option.get_node("Text").size = new_option.get_node("Text").size * 1.25
			new_option.get_node("Text").scale = new_option.get_node("Text").scale * 0.75
		new_option.outcome = prompt # here we assign the outcome to be triggered on button press
		current_options.append(new_option)
		get_tree().get_root().add_child(new_option) # adding to main
