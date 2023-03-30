extends Node2D

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

@onready var playerCards = $PlayerCards
@onready var inst = $playInstruction
@onready var cardToBluff = $cardSelection
@onready var butt = $Button
@onready var buton = $Buton
@onready var pesto = $pass

var rng

var clubsArr = null
var diamondsArr = null
var heartsArr = null
var spadesArr = null

var playerHand = null
var cpuOneHand = null
var cpuTwoHand = null
var cpuThreeHand = null
var cpuFourHand = null
var centerHand = null
var lastRoundHand = null
var lastRoundBluff = null
var cardCount = null

var cardOfRound = null
var noWinner = null
var inRound = null
var playerTurn = null
var playerConf = null
var stageOfRound = 0




# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	rng.randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(noWinner):	
		if(playerTurn == 1):
			player()
		elif(playerTurn == 2):
			cpuTurn(1,1)
		
		
func _on_button_button_up():
	if(cardToBluff.get_selected_id() > 0 and stageOfRound < 1):
		stageOfRound = 1
		cardOfRound = cardToBluff.get_selected_id()
		cardToBluff.clear()
		cardToBluff.visible = false
	elif(stageOfRound < 1):
		cardOfRound = -1
	elif(stageOfRound == 2):
		cardCount = 0
		lastRoundHand = []
		for x in playerCards.get_children():
				if(x.get("notSelected") == false):
					#print(x)
					cardCount += 1
					lastRoundHand.append(x)
		if(cardCount > 0):
			stageOfRound = 3
			playerTurn = 2
			lastRoundBluff = false
			for x in lastRoundHand:
				var a = x.get("cardID")
				#print(a)
				var c = a.to_int()
				print(c)
				if(c != cardOfRound):
					lastRoundBluff = true
			butt.visible = false

func _on_buton_button_up():
	pass # Replace with function body.

func _on_pass_button_up():
	pass # Replace with function body.

func player():
	#Setting Directions
	if(inRound):
		#IF ITS PLAYERS TURN AND WERE ALREADY IN A ROUND
		#ALERT THEM OF CPUS MOVE AND WAIT FOR INPUT
		inst.text = "Amity: "
		pass
	else:
		#ELSE IF WE'RE NOT IN A ROUND
		#REMOVE OPTION TO CALL BLUFF AND PASS
		if(stageOfRound < 1):
			#IF HERE, THEY HAVENT SELECTED A CARD YET
			inst.text="It's your turn to start a new round, Select what type of card to play!"
			buton.visible = false
			pesto.visible = false
			butt.visible = true
			cardToBluff.visible = true
		if(stageOfRound == 1):
			#IF HERE WE WANT TO MAKE THEM ABLE TO SELECT THE CARDS TO PLAY
			#FOR ALL CARDS IN PLAYER HAND, MAKE THEM PLAYABLE
			for x in playerCards.get_children():
				x.setReady(true)
			stageOfRound = 2
		#inRound = true


func cpuTurn(cheatProc, bluffProc):
	pass
	#print(inRound)
	#print(cardOfRound)
	#print(cardCount)
	#for x in cpuOneHand:
		#print(x)

#Creates a new Game
#Right now Number of Opponents Doesn't work and is fixed
func initGame(numOfOpponents):
	#Calling to Remove Any Old Cards From Player Hand
	rmPlayerHand()
	
	#Calling To Deal New Hands, RIGHT NOW NUMBER OF OPPONENTS IS ALWAYS 2
	dealNewHands(numOfOpponents)
	"""INITIALIZING DIALOGUE"""
	Global.init_dialogue()	
	"""INITIALIZING DIALOGUE"""
	
	#Calling to Add Players Cards to Hand
	realizeHands()
	"""PLAYING DIALOGUE"""
	Global.playDialogue(0)
	"""PLAYING DIALOGUE"""


#Creates Card Nodes for player to see and interact with
func realizeHands():
	var cardPosition
	var tempNode
	var handSize = float(playerHand.size())
	for x in playerHand.size():
		if(x < (playerHand.size() / 2)):
			cardPosition = Vector2(900 - (x * 95),900 + (10 * x))
			tempNode = Global.newNode(card, cardPosition, playerCards, 1)
			tempNode.texture = get(playerHand[x])
			tempNode.scale *=.40
			tempNode.rotation = float((-x) / (2 * handSize))
			tempNode.setCardID(playerHand[x])
		else:
			cardPosition = Vector2(900 + ((handSize - x)* 95),900 + (10 * (handSize - x)))
			tempNode = Global.newNode(card, cardPosition, playerCards, 1)
			tempNode.texture = get(playerHand[x])
			tempNode.scale *=.40
			tempNode.rotation = float((handSize - x) / (2 * handSize))
			tempNode.setCardID(playerHand[x])
	
#Deals out new hands for the new game
func dealNewHands(numOfOpponents):
	#Setting Deck To Be Full Again
	clubsArr = [1,2,3,4,5,6,7,8,9,10,11,12,13]
	diamondsArr = [1,2,3,4,5,6,7,8,9,10,11,12,13]
	heartsArr = [1,2,3,4,5,6,7,8,9,10,11,12,13]
	spadesArr = [1,2,3,4,5,6,7,8,9,10,11,12,13]
	#Setting all players to have no cards
	playerHand = []
	cpuOneHand = []
	cpuTwoHand = []
	cpuThreeHand = []
	cpuFourHand = []
	
	#Setting Pot Cards to be empty
	centerHand = []
	
	for x in 7:
		playerHand.append(getRandomCard())
		cpuOneHand.append(getRandomCard())
	
func getRandomCard():
	var noNewCard = true
	var firstCardSuit
	var firstCard
	var cardToReturn
	while noNewCard:
		firstCardSuit = rng.randi_range(1, 4)
		firstCard = rng.randi_range(1, 13)
		if firstCardSuit == 1:
			if int(clubsArr[firstCard - 1]) == int(firstCard):
				clubsArr[firstCard - 1] = 'X'
				noNewCard = false
				cardToReturn = 'c' + str(firstCard)
		elif firstCardSuit == 2:
			if int(diamondsArr[firstCard - 1]) == int(firstCard):
				diamondsArr[firstCard - 1] = 'X'
				noNewCard = false
				cardToReturn = 'd' + str(firstCard)
		elif firstCardSuit == 3:
			if int(heartsArr[firstCard - 1]) == int(firstCard):
				heartsArr[firstCard - 1] = 'X'
				noNewCard = false
				cardToReturn = 'h' + str(firstCard)
		elif firstCardSuit == 4:
			if int(spadesArr[firstCard - 1]) == int(firstCard):
				spadesArr[firstCard - 1] = 'X'
				noNewCard = false
				cardToReturn = 's' + str(firstCard)
	return cardToReturn
	
func rmPlayerHand():
	""" 
	For Every Card in the Player Hand,
		Remeove it as a child of player hand
		and delete the card node
	"""
	for x in playerCards.get_children():
		playerCards.remove_child(x)
		x.queue_free()
	
	#Resetting Game Status
	noWinner = true
	playerTurn = 1
	inRound = false
	cardOfRound = -1
