extends Control

@onready var currentLevel = "bunny"

@onready var playerTurn = 1
@onready var myCards = $PlayerCards


@onready var card = preload("res://Scenes/Card.tscn")

@onready var c1 = preload("res://Assets/Cards/Clubs/c1.png")
@onready var c2 = preload("res://Assets/Cards/Clubs/c2.png")
@onready var c3 = preload("res://Assets/Cards/Clubs/c3.png")
@onready var c4 = preload("res://Assets/Cards/Clubs/c4.png")
@onready var c5 = preload("res://Assets/Cards/Clubs/c5.png")
@onready var c6 = preload("res://Assets/Cards/Clubs/c6.png")
@onready var c7 = preload("res://Assets/Cards/Clubs/c7.png")
@onready var c8 = preload("res://Assets/Cards/Clubs/c8.png")
@onready var c9 = preload("res://Assets/Cards/Clubs/c9.png")
@onready var c10 = preload("res://Assets/Cards/Clubs/c10.png")
@onready var c11 = preload("res://Assets/Cards/Clubs/c11.png")
@onready var c12 = preload("res://Assets/Cards/Clubs/c12.png")
@onready var c13 = preload("res://Assets/Cards/Clubs/c13.png")

@onready var d1 = preload("res://Assets/Cards/Diamonds/d1.png")
@onready var d2 = preload("res://Assets/Cards/Diamonds/d2.png")
@onready var d3 = preload("res://Assets/Cards/Diamonds/d3.png")
@onready var d4 = preload("res://Assets/Cards/Diamonds/d4.png")
@onready var d5 = preload("res://Assets/Cards/Diamonds/d5.png")
@onready var d6 = preload("res://Assets/Cards/Diamonds/d6.png")
@onready var d7 = preload("res://Assets/Cards/Diamonds/d7.png")
@onready var d8 = preload("res://Assets/Cards/Diamonds/d8.png")
@onready var d9 = preload("res://Assets/Cards/Diamonds/d9.png")
@onready var d10 = preload("res://Assets/Cards/Diamonds/d10.png")
@onready var d11 = preload("res://Assets/Cards/Diamonds/d11.png")
@onready var d12 = preload("res://Assets/Cards/Diamonds/d12.png")
@onready var d13 = preload("res://Assets/Cards/Diamonds/d13.png")

@onready var h1 = preload("res://Assets/Cards/Hearts/h1.png")
@onready var h2 = preload("res://Assets/Cards/Hearts/h2.png")
@onready var h3 = preload("res://Assets/Cards/Hearts/h3.png")
@onready var h4 = preload("res://Assets/Cards/Hearts/h4.png")
@onready var h5 = preload("res://Assets/Cards/Hearts/h5.png")
@onready var h6 = preload("res://Assets/Cards/Hearts/h6.png")
@onready var h7 = preload("res://Assets/Cards/Hearts/h7.png")
@onready var h8 = preload("res://Assets/Cards/Hearts/h8.png")
@onready var h9 = preload("res://Assets/Cards/Hearts/h9.png")
@onready var h10 = preload("res://Assets/Cards/Hearts/h10.png")
@onready var h11 = preload("res://Assets/Cards/Hearts/h11.png")
@onready var h12 = preload("res://Assets/Cards/Hearts/h12.png")
@onready var h13 = preload("res://Assets/Cards/Hearts/h13.png")

@onready var s1 = preload("res://Assets/Cards/Spades/s1.png")
@onready var s2 = preload("res://Assets/Cards/Spades/s2.png")
@onready var s3 = preload("res://Assets/Cards/Spades/s3.png")
@onready var s4 = preload("res://Assets/Cards/Spades/s4.png")
@onready var s5 = preload("res://Assets/Cards/Spades/s5.png")
@onready var s6 = preload("res://Assets/Cards/Spades/s6.png")
@onready var s7 = preload("res://Assets/Cards/Spades/s7.png")
@onready var s8 = preload("res://Assets/Cards/Spades/s8.png")
@onready var s9 = preload("res://Assets/Cards/Spades/s9.png")
@onready var s10 = preload("res://Assets/Cards/Spades/s10.png")
@onready var s11 = preload("res://Assets/Cards/Spades/s11.png")
@onready var s12 = preload("res://Assets/Cards/Spades/s12.png")
@onready var s13 = preload("res://Assets/Cards/Spades/s13.png")


func _ready():
	Global.m_parent = self
	Global.newGame()
	playGame()

func _exit_tree():
	Global.m_parent = null


func playGame():
	var cardPosition
	var tempNode
	var handSize = float(Global.playerHand.size())
	for x in Global.playerHand.size():
		if(x < (Global.playerHand.size() / 2)):
			cardPosition = Vector2(900 - (x * 95),900 + (10 * x))
			tempNode = Global.newNode(card, cardPosition, myCards, 1)
			tempNode.texture = get(Global.playerHand[x])
			tempNode.scale *=.40
			tempNode.rotation = float((-x) / (2 * handSize))
		else:
			cardPosition = Vector2(900 + ((handSize - x)* 95),900 + (10 * (handSize - x)))
			tempNode = Global.newNode(card, cardPosition, myCards, 1)
			tempNode.texture = get(Global.playerHand[x])
			tempNode.scale *=.40
			tempNode.rotation = float((handSize - x) / (2 * handSize))
	# Load level-specific information
	### we can preload most of these for the time being since there is only 1 level
	# Load Paper Overlay shader
	$Background.material.set_shader_parameter("overlay", preload("res://Assets/BunnyTable/Paper Texture Overlay.png"))
	# begin dialogue
	Global.playDialogue("1a")
