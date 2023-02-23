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
onready var dialogueBox = preload("res://Scenes/DialogueBox.tscn")
onready var dialogueOption = preload("res://Scenes/DialogueOption.tscn")
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
	var newNode = node.instance()
	parent.add_child(newNode)
	newNode.global_position = location
	newNode.scale *= scaleMult
	return newNode

func init_dialogue():
	character_dialogue_dict[0] = ["Mind if I smoke?", [0,1]]
	character_dialogue_dict[1] = ["Mm.", [2,3]]
	character_dialogue_dict[2] = ["Fine then.", [2,3]]
	character_dialogue_dict[3] = ["Only when I'm with someone I can't stand.", [3]]
	character_dialogue_dict[4] = ["And?", [4]]

	player_dialogue_dict[0] = ["Go ahead.", 1]
	player_dialogue_dict[1] = ["Hell No.", 2]
	player_dialogue_dict[2] = ["You smoke often?", 3]
	player_dialogue_dict[3] = ["I have a few questions.", 4]

func playDialogue(key):
	# Erase old prompt
	if current_prompt != null:
		current_prompt.queue_free()
	# Erase old options
	while not(current_options.empty()):
		var prompt = current_options.pop_front()
		prompt.queue_free()
	# Lookup prompt string
	var prompt_text = Global.character_dialogue_dict[key][0]
	var prompt_size = len(prompt_text)
	# Lookup options key array
	var options = Global.character_dialogue_dict[key][1]
	# Create visual prompt
	current_prompt = dialogueBox.instance()
	current_prompt.rect_position = Vector2(100, 100)
	current_prompt.get_node("Text").bbcode_text = "[center]" + prompt_text + "[/center]"
	# Reference for updating font size at runtime:
	# https://godotengine.org/qa/42430/changing-font-size-of-theme-or-control-at-runtime
	var font = current_prompt.get_node("Text").get_font("normal_font", "")
	if prompt_size < 10:
		font.size = 75
	elif prompt_size < 20:
		font.size = 60
	else:
		font.size = 45
	current_prompt.get_node("Text").add_font_override("normal_font", font)
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
		var new_option = dialogueOption.instance()
		new_option.rect_position = Vector2((1920/(1 + num_options))*(i + 1) - 215, 500)
		new_option.get_node("Text").bbcode_text = "[center]" + option_text + "[/center]"
		# Update font size to fit box as needed
		font = new_option.get_node("Text").get_font("normal_font", "")
		if option_size < 10:
			font.size = 75
		elif option_size < 20:
			font.size = 60
		else:
			font.size = 45
		new_option.get_node("Text").add_font_override("normal_font", font)
		new_option.outcome = prompt # here we assign the outcome to be triggered on button press
		print(prompt)
		print(new_option.outcome)
		current_options.append(new_option)
		get_tree().get_root().add_child(new_option) # adding to main
