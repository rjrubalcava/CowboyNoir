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

@onready var playerCards = $BluffyTheVampireSlayer/PlayerCards
@onready var inst = $BluffyTheVampireSlayer/playInstruction
@onready var revolvy = $BluffyTheVampireSlayer/Revolvy
@onready var revolvyCard = $BluffyTheVampireSlayer/textSelected
@onready var revIMG = $BluffyTheVampireSlayer/RevolvyIMG
@onready var tsl = $BluffyTheVampireSlayer/Revolvy/TextSupaLeft
@onready var tl = $BluffyTheVampireSlayer/Revolvy/TextLeft
@onready var tc = $BluffyTheVampireSlayer/Revolvy/TextCenter
@onready var tr = $BluffyTheVampireSlayer/Revolvy/TextRight
@onready var tsr = $BluffyTheVampireSlayer/Revolvy/TextSupaRight

@onready var bluffCnfrm = $BluffyTheVampireSlayer/Button
@onready var callBluffBtn = $BluffyTheVampireSlayer/Buton
@onready var pesto = $BluffyTheVampireSlayer/pass
@onready var bluffy = $BluffyTheVampireSlayer

var rng
var pushGaugeLvl = 0

var clubsArr = null
var diamondsArr = null
var heartsArr = null
var spadesArr = null

var pauseDialogue = false
var stressLevel = 0
var psychometerStage = 0
var dontDisplay = true
var stress_up_sounds = ["chips_Stacking_1","chips_Stacking_2"]
var stress_down_sounds = ["chips_Stacking_neg_1"]

#NEWVARS
var flipLeft = false
var flipRight = false
var canFlip = true
var oldRotation = 0
var cardOfRound = null
var cpuCallProc = 15 #LIKELIHOOD TO CALL A BLUFF
var cpuBluffProc = 30 #LIKELIHOOD TO BLUFF

#VARS TO KEEP TRACK OF FOR BLUFF
var centerHand = null
var playerHand = null
var cpuOneHand = null
var stageOfRound = ''
var depthOfRound = 0
var cardsReady = false
var cardCount = 0
var cardsPlayedInRound = 0
var lastRoundHand = []
var lastRoundBluff = false
var lastRoundPass = false
var depthOfTurns = 0
var noWinner = true


# Called when the node enters the scene tree for the first time.
func _ready():
	# Set cursor to be Amity's (eventually will have a different one for each character)
	Input.set_custom_mouse_cursor(preload("res://Assets/BunnyTable/Cursor_Final.png")) #Reference: 
		# https://godotengine.org/qa/1155/way-to-change-what-cursor-looks-like-in-game-via-gdscript
	rng = RandomNumberGenerator.new()
	rng.randomize()
	revolvyCard.text = tc.text

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel") and $Journal.visible:
		# Show global dialogue elements if dialogue has been previously paused
		if pauseDialogue:
			for option in Global.current_options:
				option.show()
			Global.current_prompt.show()
			# Unpause
			pauseDialogue = false
		# Close journal
		$Journal.hide()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(depthOfTurns >= 1):
		dontDisplay = true
		incPshGge()
		depthOfTurns = 0
	if(dontDisplay):
		bluffy.visible = false
	else:
		bluffy.visible = true
		if(stageOfRound == 'A'):
			#PLAYER IS STARTING A NEW ROUND
			pesto.visible = true
			bluffCnfrm.visible = true
			callBluffBtn.visible = false
			revolvy.visible = false
			revolvyCard.text = ''
			inst.text = "It Is Your Turn To Start A Round, You Can Either Pass Or Play"
		elif(stageOfRound == 'B'):
			#PLAYER CHOSE TO PLAY NEW ROUND, CHOOSING A CARD TYPE
			pesto.visible = false
			bluffCnfrm.visible = true
			callBluffBtn.visible = false
			revolvy.visible = true
			inst.text = "Good Choice Partner, Select Which Rank Of Card Would You Like To Play"
		elif(stageOfRound == 'C'):
			#PLAYER HAS CHOSEN CARD TO PLAY VALUE ALLOW THEM TO SELECT A NONZERO NUMBER OF CARDS
			pesto.visible = false
			bluffCnfrm.visible = true
			callBluffBtn.visible = false
			revolvy.visible = false
			var boxText = "Mighty Fine Choice " + revolvyCard.text + "'s Are A Great Rank To Play. Select The Cards You Would Like To Play"
			inst.text = boxText
			if(!cardsReady):
				playerCardsReady(true)
		elif(stageOfRound == 'D'):
			#CPUS TURN IN THE MIDDLE OF A ROUND
			if (cpuOneHand.size() > 0):
				cupieD()
			else:
				noWinner = false
		elif(stageOfRound == 'E'):
			#CPU PLAYED A MOVE, NOW PLAYERS TURN MID ROUND
			pesto.visible = true
			bluffCnfrm.visible = true
			callBluffBtn.visible = true
			revolvy.visible = false
			if(cardsReady):
				playerCardsReady(false)
		elif(stageOfRound == 'F'):
			#HERE THE CPU STARTS A NEW ROUND
			pesto.visible = false
			bluffCnfrm.visible = false
			callBluffBtn.visible = false
			revolvy.visible = false
			if(cardsReady):
				playerCardsReady(false)
			cupieF()
		elif(stageOfRound == 'G'):
			cupieG()
		elif(stageOfRound == 'H'):
			cupieG()
		elif(stageOfRound == 'Y'):
			#AMITY WON
			pass
		elif(stageOfRound == 'Z'):
			#PLAYER WON
			pass
		else:
			print("SOMETHING GOT REALLY WEIRD REALLY FAST")
	if(flipLeft):
		flipperLefter(delta)
	elif(flipRight):
		flipperRighter(delta)


func lost(cpuOrNot):
	if(cpuOrNot):
		for x in centerHand:
			cpuOneHand.append(x)
		stageOfRound = 'F'
		depthOfRound = 0
		if(playerHand.size() == 0):
			noWinner = false
			stageOfRound = 'Z'
			$RoundReshuffle.play()
	else:
		$cardPickup.play()
		for x in centerHand:
			playerHand.append(x)
		stageOfRound = 'A'
		depthOfRound = 0
		if(cpuOneHand.size() == 0):
			noWinner = false
			inst.text = "Amity Beat You!"
			stageOfRound = 'Y'
			$RoundReshuffle.play()
			
	centerHand = []
	depthOfTurns += 1
	
	realizeHands()

func cupieD():
	print(cpuOneHand)
	print(cardCount)
	print(lastRoundBluff)
	print(lastRoundPass)
	print(centerHand)
	#CPUS TURN IN THE MIDDLE OF A ROUND
	#LAST ROUND BLUFF, LAST ROUND PASS, CARD COUNT, SHOULD BE SET
	#NEED TO DECIDE WHETHER TO PASS, PLAY, OR CALL BLUFF
	if(shouldCupieCallBluff()):
		print("I CALLED BLUFF")
		if(lastRoundBluff):
			print("I Won")
			lost(false)
			#WE GO TO A
		else:
			print("I Lost")
			lost(true)
			#WE GO TO F
	else:
		print("I DIDNT CALL BLUFF")
		#IF HERE, WE DO NOT CALL BLUFF
		#CHECK FOR IF WE HAVE A POSSIBLE MOVE
		var cpusCards = 0
		var cupieHasMove = false
		for x in cpuOneHand:
			if(x.to_int() == cardOfRound):
				cupieHasMove = true
				cpusCards += 1
		if(cupieHasMove):
			print("I Have A Move")
			#IF HERE CPU HAS MOVE, DECIDE TO BLUFF OR PLAY
			var shouldBluff = cpuBluffProc
			#BLUFF HALF AS MANY TIMES IF WE HAVE A MOVE
			shouldBluff /= 2
			if(rng.randi_range(0,100) < shouldBluff):
				print("Bluffing Despite Move")
				#IF HERE, WE HAVE A MOVE, BUT WILL BLUFF ANYWAYS
				cardCount = cpusCards
				lastRoundBluff = true
				for x in cpuOneHand:
					#print(x)
					#print(cardOfRound)
					if(cpusCards > 0):
						centerHand.append(x)
						cpuOneHand.erase(x)
						cpusCards -= 1
				stageOfRound = 'E'
			else:
				#IF HERE, WE HAVE A MOVE AND WILL DO THAT MOVE
				print("Doing Non Bluff Move")
				cardCount = 0
				lastRoundBluff = false
				for x in cpuOneHand:
					#print(x)
					#print(cardOfRound)
					if(x.to_int() == cardOfRound and cpusCards > 0):
						centerHand.append(x)
						cpuOneHand.erase(x)
						cardCount += 1
				stageOfRound = 'E'
		else:
			#OTHERWISE, IF NO MOVE, DECIDE IF WE SHOULD PASS OR BLUFF
			print("I Don't Have A Move")
			if(rng.randi_range(0,100) < cpuBluffProc):
				#IF HERE, WE CHOOSE TO BLUFF AND NO MOVE
				print("I Am Going To Bluff")
				cardCount = 0
				lastRoundBluff = true
				lastRoundPass = false
				var cardsToBluff = rng.randi_range(1,4 - cardCount)
				if(cardsToBluff > cpuOneHand.size()):
					cardsToBluff = cpuOneHand.size()
				for x in cpuOneHand:
					if(cardsToBluff > 0):
						cardCount += 1
						centerHand.append(x)
						cpuOneHand.erase(x)
						cardsToBluff -= 1
				stageOfRound = 'E'
			else:
				#IF HERE WE PASS
				print("I Am Going To Pass")
				lastRoundBluff = false
				lastRoundHand = []
				if(lastRoundPass):
					stageOfRound = 'A'
					centerHand = []
				else:
					lastRoundPass = true
					stageOfRound = 'E'
	print(cpuOneHand)
	print(cardCount)
	print(lastRoundBluff)
	print(lastRoundPass)
	print(centerHand)
	realizeHands()
	if(lastRoundPass):
		inst.text = "Amity Passed, It Is Your Turn Again"
	elif(stageOfRound == 'A'):
		inst.text = "Amity Called Bluff And Won"
	elif(stageOfRound == 'F'):
		inst.text = "Amity Called Bluff And Lost"
	else: 
		inst.text = "Amity Played " + str(cardCount) + " cards, and she has " + str(cpuOneHand.size()) + " cards left Will You Call Bluff, Pass, Or Play"

func cupieF():
	#CPU WILL NEVER PASS ON A FIRST TURN BC THATS USELESS
	#CHECK IF THERE ARE MORE THAN ONE VALUE IN HAND
	depthOfTurns += 1
	var hasMoreThanOneValues = false
	for x in cpuOneHand:
		for y in cpuOneHand:
			if(x.to_int() != y.to_int()):
				hasMoreThanOneValues = true
	if(hasMoreThanOneValues):
		if(rng.randi_range(0,100) < cpuBluffProc):
			#WILL BLUFF
			stageOfRound = 'H'
		else:
			#WILL PLAY STRAIGHT
			stageOfRound = 'G'
	else:
		#IF WE ONLY HAVE ONE VALUE OF CARD, WE PLAY STRAIGHT BECAUSE WE WILL WIN
		stageOfRound = 'G'

func cupieG():
	lastRoundBluff = false
	lastRoundPass = false
	cardCount = 0
	cardOfRound = cpuOneHand[0].to_int()
	for x in cpuOneHand:
		if(x.to_int() == cardOfRound):
			centerHand.append(x)
			cpuOneHand.erase(x)
			cardCount += 1
	stageOfRound = 'E'
	if(cardOfRound == 1):
		revolvyCard.text = "A"
	elif(cardOfRound == 11):
		revolvyCard.text = "J"
	elif(cardOfRound == 12):
		revolvyCard.text = "Q"
	elif(cardOfRound == 13):
		revolvyCard.text = "K"
	else:
		revolvyCard.text = str(cardOfRound)
	inst.text = "Amity Started The Round By Playing " + str(cardCount) + " " + revolvyCard.text + "'s Will You Pass, Play, or Call Bluff"

func cupieH():
	#HERE TO BLUFF ON THE FIRST ROUND
	lastRoundBluff = false
	lastRoundPass = false
	cardCount = 0
	var cardToFake
	for x in cpuOneHand:
		for y in cpuOneHand:
			if(x.to_int() != y.to_int()):
				cardOfRound = y.to_int()
				cardToFake = x.to_int()
	for x in cpuOneHand:
		if(x.to_int() == cardToFake):
			centerHand.append(x)
			cpuOneHand.erase(x)
			cardCount += 1
	stageOfRound = 'E'
	if(cardOfRound == '1'):
		revolvyCard.text = "A"
	elif(cardOfRound == '11'):
		revolvyCard.text = "J"
	elif(cardOfRound == '12'):
		revolvyCard.text = "Q"
	elif(cardOfRound == '13'):
		revolvyCard.text = "K"
	else:
		revolvyCard.text = str(cardOfRound)
	inst.text = "Amity Started The Round By Playing " + str(cardCount) + " " + revolvyCard.text + "'s Will You Pass, Play, or Call Bluff"

func shouldCupieCallBluff():
	if(playerHand.size() == 0):
		#print("I CALLED BC PLAYER HAS NO CARDS")
		return(true)
	if(lastRoundPass):
		#print("I DIDNT CALL BC PLAYER DIDNT PLAY ANY CARDS")
		return(false)
	var cpusCardsOfRound = 0
	for x in cpuOneHand:
		if(x.to_int() == cardOfRound):
			cpusCardsOfRound += 1
	if((cpusCardsOfRound + cardCount) > 4):
		#print("I CALLED BC TOO MANY CARDS")
		return(true)
	else:
		var a = randi_range(0,100)
		a /= depthOfRound
		if(a < cpuCallProc):
			#print(a)
			return(true)
		else:
			#print("I DIDNT CALL BC PROC DIDNT HIT")
			return(false)

func flipperLefter(delta):
	canFlip = false
	if(revolvy.rotation_degrees < 45):
		
		revIMG.rotation_degrees += (delta * 120)
		revolvy.rotation_degrees += (delta * 120)
	else:
		#IF WE ARE HERE WE HAVE FINISHED ROTATION AND SHOULD CHANGE NUMBERS
		tsr.text = tr.text
		tr.text = tc.text
		tc.text = tl.text
		tl.text = tsl.text
		if(tsl.text == "A"):
			tsl.text = "K"
		elif(tsl.text == "K"):
			tsl.text = "Q"
		elif(tsl.text == "Q"):
			tsl.text = "J"
		elif(tsl.text == "J"):
			tsl.text = "10"
		elif(tsl.text == "2"):
			tsl.text = "A"		
		else:
			tsl.text = str((int(tsl.text) - 1))
		revolvyCard.text = tc.text
		oldRotation = revIMG.rotation_degrees
		revolvy.rotation_degrees = 0
		flipLeft= false
		canFlip = true
		cardOfRound = revolvyCard.text

func flipperRighter(delta):
	canFlip = false
	if(revolvy.rotation_degrees > -45):
		
		revIMG.rotation_degrees -= (delta * 120)
		revolvy.rotation_degrees -= (delta * 120)
	else:
		#IF WE ARE HERE WE HAVE FINISHED ROTATION AND SHOULD CHANGE NUMBERS
		tsl.text = tl.text
		tl.text = tc.text
		tc.text = tr.text
		tr.text = tsr.text
		if(tsr.text == "A"):
			tsr.text = "2"
		elif(tsr.text == "K"):
			tsr.text = "A"
		elif(tsr.text == "Q"):
			tsr.text = "K"
		elif(tsr.text == "J"):
			tsr.text = "Q"
		elif(tsr.text == "10"):
			tsr.text = "J"		
		else:
			tsr.text = str((int(tsr.text) + 1))
		revolvyCard.text = tc.text
		oldRotation = revIMG.rotation_degrees
		revolvy.rotation_degrees = 0
		flipRight= false
		canFlip = true
		cardOfRound = revolvyCard.text

func _on_button_button_up():
	#CONFIRM BUTTON
	$Click.play()
	if(stageOfRound == 'A'):
		#CHOOSING TO PLAY NEW ROUND
		cardsPlayedInRound = 0
		depthOfRound = 0
		stageOfRound = 'B'
		revolvyCard.text = tc.text
	elif(stageOfRound == 'B'):
		#GOING TO SELECT A RANK OF CARD TO PLAY
		depthOfRound = 0
		if(revolvyCard.text == 'A'):
			cardOfRound = 1
		elif(revolvyCard.text == 'K'):
			cardOfRound = 13
		elif(revolvyCard.text == 'Q'):
			cardOfRound = 12
		elif(revolvyCard.text == 'J'):
			cardOfRound = 11
		else:
			cardOfRound = revolvyCard.text.to_int()
		stageOfRound = 'C'
		cardsPlayedInRound = 0
		#print(cardOfRound)
	elif(stageOfRound == 'C'):
		cardCount = 0
		lastRoundHand = []
		for x in playerCards.get_children():
			if(x.get("notSelected") == false):
				cardCount += 1
				lastRoundHand.append(x)
		if(cardCount > 0):
			depthOfRound += 1
			cardsPlayedInRound += cardCount
			stageOfRound = 'D'
			lastRoundPass = false
			lastRoundBluff = false
			for x in lastRoundHand:
				var a = x.get("cardID")
				centerHand.push_back(a)
				playerHand.erase(x.get("cardID"))
				var c = a.to_int()
				if(c != cardOfRound):
					lastRoundBluff = true
			playerCardsReady(false)
	elif(stageOfRound == 'E'):
		stageOfRound = 'C'

func _on_buton_button_up():
	#CALL BLUFF BUTTON
	$Click.play()
	if(stageOfRound == 'E'):
		if(lastRoundBluff):
			lost(true)
		else:
			lost(false)
	
func _on_pass_button_up():
	#PASS BUTTON
	$Click.play()
	if(stageOfRound == 'A'):
		stageOfRound = 'F'
	elif(stageOfRound == 'E'):
		if(lastRoundPass):
			stageOfRound = 'F'
			depthOfTurns += 1
			centerHand = []
		else:
			lastRoundPass = true
			stageOfRound = 'D'

func playerCardsReady(toReady):
	cardsReady = toReady
	for x in playerCards.get_children():
				x.setReady(toReady)

func incPshGge():
	print("Accessed")
	print(depthOfTurns)
	dontDisplay = true
	Global.current_prompt.show()
	for option in Global.current_options:
		option.show()

#Creates a new Game
#Right now Number of Opponents Doesn't work and is fixed
func initGame():
	#Calling to Remove Any Old Cards From Player Hand
	rmPlayerHand()
	#Calling To Deal New Hands
	dealNewHands()
	#Calling to Add Players Cards to Hand
	realizeHands()
	
	var cpuTurn = flipCoin()
	print(cpuTurn)
	stageOfRound = 'A'

#Tails If Under 50, Heads Otherwise 
func flipCoin():
	var hOrT = rng.randi_range(0,100)
	return(hOrT >= 50)

#Creates Card Nodes for player to see and interact with
func realizeHands():
	rmPlayerHand()
	var cardPosition
	var tempNode
	var handSize = float(playerHand.size())
	if(handSize > 0):
		for x in playerHand.size():
			if(x < (playerHand.size() / 2)):
				cardPosition = Vector2(900 - (x * 95),900 + (10 * x))
				tempNode = Global.newNode(card, cardPosition, playerCards, 1)
				tempNode.texture = get(playerHand[x])
				tempNode.rotation = float((-x) / (2 * handSize))
				tempNode.setCardID(playerHand[x])
			else:
				cardPosition = Vector2(900 + ((handSize - x)* 95),900 + (10 * (handSize - x)))
				tempNode = Global.newNode(card, cardPosition, playerCards, 1)
				tempNode.texture = get(playerHand[x])
				tempNode.rotation = float((handSize - x) / (2 * handSize))
				tempNode.setCardID(playerHand[x])
		
#Deals out new hands for the new game
func dealNewHands():
	#Setting Deck To Be Full Again
	clubsArr = [1,2,3,4,5,6,7,8,9,10,11,12,13]
	diamondsArr = [1,2,3,4,5,6,7,8,9,10,11,12,13]
	heartsArr = [1,2,3,4,5,6,7,8,9,10,11,12,13]
	spadesArr = [1,2,3,4,5,6,7,8,9,10,11,12,13]
	#Setting all players to have no cards
	playerHand = []
	cpuOneHand = []
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
	for x in playerCards.get_children():
		playerCards.remove_child(x)
		x.queue_free()
	
func updateStress(stress):
	if stress > 0:
		var curr_sound = get_node(stress_up_sounds.pick_random())
		
		curr_sound.set_pitch_scale(1 + randf_range(0.2,0.5))
		curr_sound.play()
	if stress < 0:
		var curr_sound = get_node(stress_down_sounds.pick_random()) 
		
		curr_sound.set_pitch_scale(1 - randf_range(0.2,0.5))
		curr_sound.play()
	stressLevel += stress
	if stressLevel < 0:
		stressLevel = 0
	if stressLevel < 30:
		$Character.texture = preload("res://Assets/BunnyTable/Final Amity 1.png")
	elif stressLevel < 60:
		$Character.texture = preload("res://Assets/BunnyTable/Final Amity 2.png")
	elif stressLevel < 90:
		$Character.texture = preload("res://Assets/BunnyTable/Final Amity 3.png")
	elif (stressLevel < 120):
		$Character.texture = preload("res://Assets/BunnyTable/Final Amity 4.png")
	else:
		$Character.texture = preload("res://Assets/BunnyTable/Final Amity BREAK.png")
		$HSpace_is_ready.play()
		$Breakpoint.show()
		$Breakpoint.get_node("BreakpointAnim").play()

func _on_song_start_finished():
	print("song finished playing")
	$Song_loop.play()  

func _on_breakpoint_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/BunnyHeadspace.tscn")

func _on_journal_button_pressed():
	# Open journal
	$Click.play()
	# Hide global dialogue elements
	if Global.current_prompt.visible:
		# Pause  so dialogue isn't revealed on closing menu if it was already hidden
		pauseDialogue = true
		for option in Global.current_options:
			option.hide()
		Global.current_prompt.hide()
	# Open journal
	if $Journal.visible:
		# Show global dialogue elements if dialogue has been previously paused
		if pauseDialogue:
			for option in Global.current_options:
				option.show()
			Global.current_prompt.show()
			# Unpause
			pauseDialogue = false
		# Close journal
		$Journal.hide()
	else:
		$Journal.show()

func _on_butt_left_button_up():
	if(canFlip):
		canFlip = false
		flipLeft = true
		$"Revolver Click".set_pitch_scale(0.85)
		$"Revolver Click".play()

func _on_butt_right_button_up():
	if(canFlip):
		canFlip = false
		flipRight = true
		$"Revolver Click".play()
		$"Revolver Click".set_pitch_scale(1.1)
