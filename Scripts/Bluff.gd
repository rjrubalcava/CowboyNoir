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

@onready var butt = $BluffyTheVampireSlayer/Button
@onready var buton = $BluffyTheVampireSlayer/Buton
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
var stress_up_sounds = ["chips_Stacking_1","chips_Stacking_2","chips_Stacking_3"]
var dontDisplay = true

#NEWVARS
var flipLeft = false
var flipRight = false
var canFlip = true
var oldRotation = 0
var cardOfRound = null
var cpuTurn = null #POSITIVE FOR CPU TURN, NEGATIVE FOR PLAYERS TURN
var cpuCallProc = 15 #LIKELIHOOD TO CALL A BLUFF
var cpuBluffProc = 30 #LIKELIHOOD TO BLUFF

#VARS TO KEEP TRACK OF FOR BLUFF
var centerHand = null
var playerHand = null
var cpuOneHand = null
var stageOfRound = 0
var depthOfRound = 0
var cpuLastTurn = ""
var wasBluff = false
var cardsReady = false
var cardCount = 0
var lastRoundHand = []
var lastRoundBluff = false
var numOfPasses = 0
var depthOfTurns = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set cursor to be Amity's (eventually will have a different one for each character)
	Input.set_custom_mouse_cursor(preload("res://Assets/BunnyTable/Cursor_Final.png")) #Reference: 
		# https://godotengine.org/qa/1155/way-to-change-what-cursor-looks-like-in-game-via-gdscript
	rng = RandomNumberGenerator.new()
	rng.randomize()
	revolvyCard.text = tc.text

func _unhandled_input(event):
	if event.is_action_pressed("ui_up"):
		incPshGge()
	elif event.is_action_pressed("ui_down"):
		get_tree().change_scene_to_file("res://Scenes/BunnyHeadspace.tscn")
	# Close journal if it is open and esc is pressed
	elif event.is_action_pressed("ui_cancel") and $Journal.visible:
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
	if(depthOfTurns >= 3):
		dontDisplay = true
		incPshGge()
		depthOfTurns = 0
	if(dontDisplay):
		bluffy.visible = false
	else:
		bluffy.visible = true
		if(cpuTurn):
			cupieTurn()
		else:
			player()	
	if(flipLeft):
		flipperLefter(delta)
	elif(flipRight):
		flipperRighter(delta)
		
func cupieTurn():
	print(stageOfRound)
	revolvy.visible = false
	butt.visible = false
	buton.visible = false
	pesto.visible = false
	inst.text = "Amity is deciding what to do"
	if(stageOfRound == 0):
		#IF HERE, HERE TURN TO START A NEW ROUND
		numOfPasses = 0
		print("STAGE 0")
		depthOfTurns += 1
		lastRoundBluff = false
		lastRoundHand = []
		cardCount = 0
		for x in cpuOneHand:
			if(x.to_int() == cardOfRound):
				cardCount += 1
		
		if(cardCount > 0):
			for x in cpuOneHand:
				if(x.to_int() == cardOfRound):
					lastRoundHand.append(x)
					cpuOneHand.erase(x)
			print("STAGE PLAY")
		else:
			print("STAGE BLUFF")
			lastRoundBluff = true
			var cardsToBluff = rng.randi_range(0,100)
			if(cardsToBluff < 60):
				cardCount = 1
				lastRoundHand.append(cpuOneHand[0])
				cpuOneHand.erase(cpuOneHand[0])
			elif(cardsToBluff < 85):
				cardCount = 2
				lastRoundHand.append(cpuOneHand[0])
				lastRoundHand.append(cpuOneHand[1])
				cpuOneHand.erase(cpuOneHand[1])
				cpuOneHand.erase(cpuOneHand[0])
			elif(cardsToBluff < 99):
				cardCount = 3
				lastRoundHand.append(cpuOneHand[0])
				lastRoundHand.append(cpuOneHand[1])
				lastRoundHand.append(cpuOneHand[2])
				cpuOneHand.erase(cpuOneHand[2])
				cpuOneHand.erase(cpuOneHand[1])
				cpuOneHand.erase(cpuOneHand[0])
			else:
				cardCount = 4
				lastRoundHand.append(cpuOneHand[0])
				lastRoundHand.append(cpuOneHand[1])
				lastRoundHand.append(cpuOneHand[2])
				lastRoundHand.append(cpuOneHand[3])
				cpuOneHand.erase(cpuOneHand[3])
				cpuOneHand.erase(cpuOneHand[2])
				cpuOneHand.erase(cpuOneHand[1])
				cpuOneHand.erase(cpuOneHand[0])
		for x in lastRoundHand:
			centerHand.append(x)
		lastRoundHand = []
		stageOfRound = 2
		cpuTurn = false
		inst.text = "Amity Played "
		inst.add_text(str(cardCount))
		inst.add_text(" Cards, It's Your Turn To Pass, Play, or Call Bluff")
		if(cardOfRound == 1):
			revolvyCard.text = "A"
		elif(cardOfRound > 1 and cardOfRound < 10):
			revolvyCard.text = str(cardOfRound)
		elif(cardOfRound == 11):
			revolvyCard.text = "J"
		elif(cardOfRound == 12):
			revolvyCard.text = "Q"
		elif(cardOfRound == 13):
			revolvyCard.text = "K"
		print("VAVAVOOM")
	elif(stageOfRound == 2):
		#IF HERE, YOU THE PLAYER JUST PLAYED SOMETHING, AND SHE NEEDS TO RESPOND
		print("STAGE 2")
		if(shouldCupieCallBluff()):
			#IF HERE, WE ARE CALLING BLUFF
			print("STAGE CALL BLUFF")	
			if(lastRoundBluff):
				#IF SHE SUCCESSFULLY CALLED BLUFF, SHE WILL BE MORE LIKELY TO CALL BLUFF IN THE FUTURE
				if(cpuCallProc <= 100):
					cpuCallProc *= 1.1
				else:
					cpuCallProc = 100
				lost(false)
			else:
				#IF SHE UNSUCCESSFULLY CALLED BLUFF, SHE WILL BE LESS LIKELY TO CALL BLUFF IN THE FUTURE
				if(cpuCallProc >= 15):
					cpuCallProc /= 1.1
				else:
					cpuCallProc = 15
				lost(true)
		else:
			#IF HERE WE ARE NOT CALLING BLUFF AND NEED TO DECIDE WHAT TO DO
			if(shouldCupiePass()):
				print("STAGE PASS")
				#IF HERE, WE DECIDED TO PASS
				inst.text = "Amity Passed, It Is Your Turn To Play or Pass"
				numOfPasses += 1
				if(numOfPasses >= 2):
					stageOfRound = 0
					depthOfTurns += 1
					numOfPasses = 0
				else:
					stageOfRound = 3
				cpuTurn = false
				lastRoundBluff = false
			else:
				numOfPasses = 0
				#IF HERE, WE HAVE DECIDED TO PLAY
				lastRoundBluff = false
				lastRoundHand = []
				cardCount = 0
				for x in cpuOneHand:
					if(x.to_int() == cardOfRound):
						cardCount += 1
				
				if(cardCount > 0):
					for x in cpuOneHand:
						if(x.to_int() == cardOfRound):
							lastRoundHand.append(x)
							cpuOneHand.erase(x)
					print("STAGE PLAY")
				else:
					print("STAGE BLUFF")
					lastRoundBluff = true
					var cardsToBluff = rng.randi_range(0,100)
					if(cardsToBluff < 60 or cpuOneHand.size() <= 1):
						cardCount = 1
						lastRoundHand.append(cpuOneHand[0])
						cpuOneHand.erase(cpuOneHand[0])
					elif(cardsToBluff < 85 or cpuOneHand.size() <= 2):
						cardCount = 2
						lastRoundHand.append(cpuOneHand[0])
						lastRoundHand.append(cpuOneHand[1])
						cpuOneHand.erase(cpuOneHand[1])
						cpuOneHand.erase(cpuOneHand[0])
					elif(cardsToBluff < 99 or cpuOneHand.size() <= 3):
						cardCount = 3
						lastRoundHand.append(cpuOneHand[0])
						lastRoundHand.append(cpuOneHand[1])
						lastRoundHand.append(cpuOneHand[2])
						cpuOneHand.erase(cpuOneHand[2])
						cpuOneHand.erase(cpuOneHand[1])
						cpuOneHand.erase(cpuOneHand[0])
					else:
						cardCount = 4
						lastRoundHand.append(cpuOneHand[0])
						lastRoundHand.append(cpuOneHand[1])
						lastRoundHand.append(cpuOneHand[2])
						lastRoundHand.append(cpuOneHand[3])
						cpuOneHand.erase(cpuOneHand[3])
						cpuOneHand.erase(cpuOneHand[2])
						cpuOneHand.erase(cpuOneHand[1])
						cpuOneHand.erase(cpuOneHand[0])
				for x in lastRoundHand:
					centerHand.append(x)
				lastRoundHand = []
				stageOfRound = 2
				cpuTurn = false
				inst.text = "Amity Played "
				inst.add_text(str(cardCount))
				inst.add_text(" Cards, It's Your Turn To Pass, Play, or Call Bluff")
				if(cardOfRound == 1):
					revolvyCard.text = "A"
				elif(cardOfRound > 1 and cardOfRound < 10):
					revolvyCard.text = str(cardOfRound)
				elif(cardOfRound == 11):
					revolvyCard.text = "J"
				elif(cardOfRound == 12):
					revolvyCard.text = "Q"
				elif(cardOfRound == 13):
					revolvyCard.text = "K"
				print("WAAAAA")


func shouldCupiePass():
	for x in cpuOneHand:
		if(x.to_int() == cardOfRound):
			return(false)
	var a = rng.randi_range(0,100)
	if(a < cpuBluffProc):
		return(false)
	else:
		return(true)


func lost(cpuOrNot):
	if(cpuOrNot):
		for x in centerHand:
			cpuOneHand.append(x)
		cpuTurn = true
	else:
		for x in centerHand:
			playerHand.append(x)
		cpuTurn = false
	centerHand = []
	realizeHands()
	depthOfRound = 0
	stageOfRound = 0
	depthOfTurns += 1
	


func shouldCupieCallBluff():
	if(playerHand.size() == 0):
		return(true)
	if(cardCount == 0):
		return(false)
	var cpusCardsOfRound = 0
	for x in cpuOneHand:
		if(x.to_int() == cardOfRound):
			cpusCardsOfRound += 1
	if(cpusCardsOfRound + cardCount > 4):
		return(true)
	else:
		var a = randi_range(0,100)
		a *= depthOfRound
		if(a < cpuCallProc):
			return(true)
		else:
			return(false)


func flipperLefter(delta):
	canFlip = false
	if(revolvy.rotation_degrees < 45):
		revIMG.rotation_degrees += (delta * 60)
		revolvy.rotation_degrees += (delta * 60)
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
		revIMG.rotation_degrees -= (delta * 60)
		revolvy.rotation_degrees -= (delta * 60)
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
	$Click.play()
	numOfPasses = 0
	if(stageOfRound == 0):
		depthOfRound = 0
		cardOfRound = revolvyCard.text
		if(cardOfRound == "K"):
			cardOfRound = 13
		elif(cardOfRound == "Q"):
			cardOfRound = 12
		elif(cardOfRound == "J"):
			cardOfRound = 11	
		elif(cardOfRound == "A"):
			cardOfRound = 1
		else:
			cardOfRound = int(cardOfRound)
		stageOfRound = 1
	elif(stageOfRound == 1 or stageOfRound == 3):
		cardCount = 0
		lastRoundHand = []
		for x in playerCards.get_children():
			if(x.get("notSelected") == false):
				cardCount += 1
				lastRoundHand.append(x)
		if(cardCount > 0):
			stageOfRound = 2
			cpuTurn = true
			lastRoundBluff = false
			for x in lastRoundHand:
				var a = x.get("cardID")
				centerHand.push_back(a)
				playerHand.erase(x.get("cardID"))
				var c = a.to_int()
				print(c)
				if(c != cardOfRound):
					lastRoundBluff = true
			butt.visible = false
			playerCardsReady(false)
			depthOfRound += 1
			realizeHands()
			
func _on_buton_button_up():
	$Click.play()
	#HERE IF PLAYER IS CALLING BLUFF
	if(lastRoundBluff):
		#IF PLAYER CALLED BLUFF ON A BLUFF, SHE BECOMES LESS LIKELY TO BLUFF
		if(cpuBluffProc >= 30):
			cpuBluffProc /= 1.1
		else:
			cpuBluffProc = 30
		lost(true)
	else:
		#IF PLAYER CALLED BLUFF ON A NON BLUFF, SHE BECOMES MORE LIKELY TO BLUFF
		if(cpuBluffProc <= 50):
			cpuBluffProc *= 1.1
		else:
			cpuBluffProc = 50
		lost(false)

func _on_pass_button_up():
	$Click.play()
	cpuTurn = true
	lastRoundBluff = false
	lastRoundHand = []
	cardCount = 0
	numOfPasses += 1
	if(numOfPasses >= 2):
		stageOfRound = 0
		numOfPasses = 0
		depthOfTurns += 1
	else: 
		stageOfRound = 2

func playerCardsReady(toReady):
	cardsReady = toReady
	for x in playerCards.get_children():
				x.setReady(toReady)

func player():
	if(stageOfRound == 0):
		if(cardsReady):
			playerCardsReady(false)
		buton.visible = false
		pesto.visible = false
		butt.visible = true
		revolvy.visible = true
		inst.text = "It's Your Turn To Start A Round, Which Type Of Card Would You Like To Play?"
	elif(stageOfRound == 1):
		buton.visible = false
		pesto.visible = false
		butt.visible = true
		revolvy.visible = false
		inst.text = "Select The Card's You Would Like To Play"
		if(!cardsReady):
			playerCardsReady(true)
	elif(stageOfRound == 2):
		buton.visible = true
		pesto.visible = true
		butt.visible = true
		revolvy.visible = false
	elif(stageOfRound == 3):
		buton.visible = false
		pesto.visible = true
		butt.visible = true
		revolvy.visible = false
		if(!cardsReady):
			playerCardsReady(true)
		

func incPshGge():
	dontDisplay = true
	Global.current_prompt.show()
	for option in Global.current_options:
		option.show()

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
	Global.playDialogue("111a")
	"""PLAYING DIALOGUE"""
	
	cpuTurn = flipCoin()
	print(cpuTurn)
	cpuTurn = false


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
func dealNewHands(numOfOpponents):
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
	print("got update")
	if stress > 0:
		var curr_sound = get_node(stress_up_sounds.pick_random())
		curr_sound.play()
	stressLevel += stress
	if stressLevel < 0:
		stressLevel = 0
	if stressLevel < 30:
		$Character.texture = preload("res://Assets/BunnyTable/Amity Base Expression.png")
	elif stressLevel < 60:
		$Character.texture = preload("res://Assets/BunnyTable/Amity Expression 2.png")
	elif stressLevel < 90:
		$Character.texture = preload("res://Assets/BunnyTable/Amity Expression 3.png")
	elif (stressLevel < 120):
		$Character.texture = preload("res://Assets/BunnyTable/Amity Expression 4.png")
	else:
		$Character.texture = preload("res://Assets/BunnyTable/Amity Expression BREAK.png")
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
	$Journal.show()


func _on_butt_left_button_up():
	if(canFlip):
		canFlip = false
		flipLeft = true


func _on_butt_right_button_up():
	if(canFlip):
		canFlip = false
		flipRight = true
