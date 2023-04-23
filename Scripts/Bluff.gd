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
@onready var cardToBluff = $BluffyTheVampireSlayer/CardSelector
@onready var butt = $BluffyTheVampireSlayer/Button
@onready var buton = $BluffyTheVampireSlayer/Buton
@onready var pesto = $BluffyTheVampireSlayer/pass
@onready var bluffy = $BluffyTheVampireSlayer

var rng
var pushGaugeLvl = 0
var depthOfGame = 0
var depthOfTurns = 0

var clubsArr = null
var diamondsArr = null
var heartsArr = null
var spadesArr = null


var centerHand = null
var playerHand = null
var cpuOneHand = null

var lastRoundHand = null
var lastRoundBluff = null
var cardCount = null

var cardOfRound = null
var noWinner = null
var inRound = null
var playerTurn = null
var playerConf = null
var stageOfRound = 0
var lastPlay = -1
var numOfPasses = 0
var dontDisplay = true


var cpuCardsLastRound = null


var stressLevel = 0
var psychometerStage = 0
var stress_up_sounds = ["chips_Stacking_1","chips_Stacking_2","chips_Stacking_3"]

var cardSyms = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
var selectorIndex = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	rng.randomize()

func _unhandled_input(event):
	if event.is_action_pressed("ui_up"):
		incPshGge()
	elif event.is_action_pressed("ui_down"):
		get_tree().change_scene_to_file("res://Scenes/BunnyHeadspace.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(dontDisplay)
	if(depthOfTurns >= 2):
		dontDisplay = true
		incPshGge()
		depthOfTurns = 0
	if(dontDisplay):
		bluffy.visible = false
	else:
		bluffy.visible = true
		if(noWinner):	
			if(playerTurn == 1):
				player()
				if(cpuOneHand.size() == 0):
					noWinner = false
					inst.text = ("Amity Beat You!")
			elif(playerTurn == 2):
				cpuTurn(75,50)
				if(playerHand.size() == 0):
					noWinner = false
					inst.text = ("You Beat Amity!")
			
		
func _on_button_button_up():
	$Click.play()
	if(stageOfRound == 0):
		stageOfRound = 1
		cardOfRound = cardToBluff.get_node("TextCenter").text
		if cardOfRound == "A":
			cardOfRound = 1
		elif cardOfRound == "J":
			cardOfRound = 11
		elif cardOfRound == "Q":
			cardOfRound = 12
		elif cardOfRound == "K":
			cardOfRound = 13
		else:
			cardOfRound = int(cardOfRound)
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
				playerHand.erase(x.get("cardID"))
				var a = x.get("cardID")
				centerHand.push_back(a)
				var c = a.to_int()
				#print(c)
				if(c != cardOfRound):
					lastRoundBluff = true
			butt.visible = false
			inRound = true
			lastPlay = 1
			for x in playerCards.get_children():
				x.setReady(false)
	elif(stageOfRound == 4):
		#IF WE ARE HERE THE PLAYER HAS CHOSEN TO PLAY AGAIN
		print("PLAYING AGAIN")
		stageOfRound = 5
		cardToBluff.visible = false
		buton.visible = false
		pesto.visible = false
		butt.visible = true
		butt.text = "Play Round"
		inst.text="Select More "
		inst.add_text(str(cardOfRound))
		inst.add_text("'s ")
		realizeHands()
		for x in playerCards.get_children():
				x.setReady(true)
	elif(stageOfRound == 5):
		cardCount = 0
		lastRoundHand = []
		for x in playerCards.get_children():
			if(x.get("notSelected") == false):
				#print(x)
				cardCount += 1
				lastRoundHand.append(x)
		if(cardCount > 0):
			stageOfRound = 3
			numOfPasses = 0
			playerTurn = 2
			lastRoundBluff = false
			for x in lastRoundHand:
				playerHand.erase(x.get("cardID"))
				var a = x.get("cardID")
				centerHand.push_back(a)
				var c = a.to_int()
				#print(c)
				if(c != cardOfRound):
					lastRoundBluff = true
			butt.visible = false
			inRound = true
			lastPlay = 1
			for x in playerCards.get_children():
				x.setReady(false)
				

func _on_buton_button_up():
	$Click.play()
	#IF WE ARE HERE, PLAYER CALLS BLUFF ON CPU
	if(lastRoundBluff):
		#IF HERE THE CPU WAS BLUFFING
		caughtBluffing(false)
		inst.text="You Caught Amity Bluffing! Her Turn Now"
		buton.visible = false
		pesto.visible = false
		butt.visible = false
		cardToBluff.visible = false
	else:
		#OTHERWISE CPU WASNT BLUFFING
		caughtBluffing(true)
		inst.text="Amity Wasn't Bluffing! Her Turn Now"
		buton.visible = false
		pesto.visible = false
		butt.visible = false
		cardToBluff.visible = false
	playerTurn = 2
	lastPlay = 2
	inRound = false

func _on_pass_button_up():
	$Click.play()
	#IF HERE, PLAYER HAS DECIDED TO PASS TURN
	numOfPasses += 1
	if(numOfPasses >= 2):
		#IF HERE BOTH CPU AND PLAYER HAVE PASSED
		depthOfTurns += 1
		numOfPasses = 0
		inRound = false
	inst.text="You Pass, Amity's Turn Now"
	cardToBluff.visible = false
	butt.visible = false
	buton.visible = false
	pesto.visible = false
	playerTurn = 2
	lastPlay = 3

func player():
	#Setting Directions
	if(inRound):
		#print(stageOfRound)
		if(lastPlay == 1 and stageOfRound == 3):
			print("HERE MOVE")
			#IF THE CPU JUST PLAYED AND PLAYED A MOVE
			buton.visible = true
			pesto.visible = true
			butt.visible = true
			butt.text = "Play"
			cardToBluff.visible = false
			stageOfRound = 4
		elif(lastPlay == 3 and stageOfRound == 3):	
			print("HERE CALLED PASS")
			inst.text="Amity Passed, Will You Pass or Play?"
			pesto.visible = true
			butt.visible = true
			butt.text = "Play"
			cardToBluff.visible = false
			buton.visible = false
			stageOfRound = 4
	else:
		#ELSE IF WE'RE NOT IN A ROUND
		#REMOVE OPTION TO CALL BLUFF AND PASS
		if(stageOfRound == 0):
			#IF HERE, THEY HAVENT SELECTED A CARD YET
			if(lastPlay < 0):
				inst.text="It's your turn to start a new round, Select what type of card to play!"
			if(lastPlay == 3):
				inst.text="Amity Passed Too. It's Your Turn To Start a New Round!"
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

#HOW OFTEN IT WILL BLUFF, HOW OFTEN IT WILL CALL BLUFF
func cpuTurn(cheatProc, bluffProc):
	if(inRound):
		print(lastPlay)
		if(lastPlay == 1):
			#IF HERE, THE PLAYER JUST PLAYED SOMETHING
			#CHECKING IF CPU SHOULD CALL BLUFF
			if(cpuCallsBluff(bluffProc)):
				#IF HERE, CPU CALLED BLUFF
				if(lastRoundBluff):
					#IF HERE, PLAYER WAS BLUFFING
					inst.text="Amity Called Your Bluff And Won! Your Turn"
					caughtBluffing(true)
				else:
					#IF HERE, PLAYER WAS NOT BLUFFING
					inst.text="Amity Called Your Bluff And Lost! Your Turn"
					caughtBluffing(false)
				#NO MATTER WHAT, IF A BLUFF IS CALLED, THE ROUND IS OVER AND IT IS THE OTHER PLAYERS TURN
				#SETTING ROUND TO BE OVER
				inRound = false
				playerTurn = 1
				stageOfRound = 0
				lastPlay = 2
			else:
				#IF HERE, CPU DOES NOT CALL BLUFF AND WILL INSTEAD CHOOSE HOW TO MOVE
				var myMove = cpuChooseMove(cheatProc)
				cpuExecuteMove(myMove)
		elif(lastPlay == 3):
			#IF HERE, PLAYER PASSED ONTO CPU, WHO DIDNT PASS
			var myMove = cpuChooseMove(cheatProc)
			cpuExecuteMove(myMove)
	else:
		#IF HERE WE ARE FREE TO MOVE AS WE PLEASE
		#1 OR 3
		inRound = true
		stageOfRound = 3
		var newM = cpuChooseNewMove(cheatProc)
		if(newM == 1):
			var card = rng.randi_range(0, cpuOneHand.size() - 1)
			cardOfRound = cpuOneHand[card].to_int()
			print("NoCheat")
			cpuExecuteMove(newM)
		else:
			cardOfRound = rng.randi_range(0,12)
			print("Cheat")
			print(cardOfRound)
			cpuExecuteMove(newM)
		
		

func cpuChooseNewMove(cheatProc):
	#ON A NEW TURN WE CHEAT HALF AS OFTEN
	var k = float(cheatProc) / 2
	var t = rng.randi_range(0,100)
	var toCheat = (k > t)
	#IF WE PLAY STRAIGHT RETURN 1
	if(!toCheat):
		return(1)
	else:
		#IF WE CHEAT RETURN 3
		return(3)
	
func cpuExecuteMove(myMove):
	if(myMove == 1):
		#IF HERE WE HAVE A CARD AND PLAY A NORMAL MOVE
		print("Normal Move")
		cardCount = 0
		lastRoundHand = []
		#CHOOSING ALL VALID CARDS TO PLAY
		for x in cpuOneHand:
			var a = x
			var c = a.to_int()
			if(c == cardOfRound):
				lastRoundHand.append(x)
				cardCount += 1
				centerHand.append(x)
				cpuOneHand.erase(x)
		printAmityTurn()
		lastPlay = 1
		lastRoundBluff = checkIfWasBluff()
		playerTurn = 1
	elif(myMove == 2):
		print("Cheat Despite Normal Move")
		#IF HERE WE CHOSE TO BLUFF EVEN THOUGH WE HAVE A MOVE
		cardCount = 0
		lastRoundHand = []
		#CHOOSING TO BLUFF WITH THE SAME AMOUNT OF CARDS WE ACTUALLY HAD
		var amt = cpuNumOfValidMoves()
		for x in cpuOneHand:
			var a = x
			var c = a.to_int()
			if(c != cardOfRound and amt > 0):
				lastRoundHand.append(x)
				cardCount += 1
				centerHand.append(x)
				amt -= 1
				cpuOneHand.erase(x)
		printAmityTurn()
		lastPlay = 1
		lastRoundBluff = checkIfWasBluff()
		playerTurn = 1
	elif(myMove == 3):
		#IF HERE WE CHEAT BC WE DONT HAVE A MOVE
		print("Cheat Move")
		#WILL CHEAT WITH A RANDOM AMOUNT OF CARDS UP TO 4 - WHATEVER PLAYER ONE PLAYED LAST ROUND
		var t = rng.randi_range(1,4 - cardCount)
		cardCount = 0
		lastRoundHand = []
		#CHOOSING TO BLUFF WITH t Cards
		var amt = t
		for x in cpuOneHand:
			if(amt > 0):
				lastRoundHand.append(x)
				cardCount += 1
				centerHand.append(x)
				amt -= 1
				cpuOneHand.erase(x)
		printAmityTurn()
		lastPlay = 1
		lastRoundBluff = checkIfWasBluff()
		playerTurn = 1
	else:
		#IF HERE WE ARE CHOOSING TO PASS
		print("Pass Move")
		numOfPasses += 1
		print(numOfPasses)
		lastPlay = 3
		cardCount = 0
		lastRoundHand = []
		lastRoundBluff = false
		playerTurn = 1
		if(numOfPasses >= 2):
			#IF HERE PLAYER AND CPU PASS
			depthOfTurns += 1
			numOfPasses = 0
			inRound = false
			stageOfRound = 0
		else:
			numOfPasses = 1
			inRound = true
			stageOfRound = 3

func printAmityTurn():
	inst.text="Amity Played "
	inst.add_text(str(cardCount))
	inst.add_text("  ")
	if(cardOfRound <= 10 and cardOfRound > 1):
		inst.add_text(str(cardOfRound))
	elif(cardOfRound == 11):
		inst.add_text("Jack")
	elif(cardOfRound == 12):
		inst.add_text("Queen")
	elif(cardOfRound == 13):
		inst.add_text("King")		
	elif(cardOfRound == 1):
		inst.add_text("Ace")
	if(cardCount > 1):
		inst.add_text("'s")
	inst.add_text(" Will You Call Bluff, Play, Or Pass")	


func checkIfWasBluff():
	var wasBluff = false
	for x in lastRoundHand:
		var a = x
		var c = a.to_int()
		if(c != cardOfRound):
			wasBluff = true
	return(wasBluff)

#1 = PLAY A NORMAL MOVE NO BLUFF
#2 = CHEAT EVEN THOOUGH YOU HAVE A MOVE
#3 = CHEAT BC YOU DONT HAVE A MOVE
#4 = PASS BC NO MOVE
func cpuChooseMove(cheatProc):
	#NOW TO DECIDE HOW CPU SHOULD PLAY
	#CHECK IF THEY HAVE A VALID CARD THEY CAN PLAY THIS TURN
	var t = rng.randi_range(0,100)
	var toCheat = (cheatProc < t)
	if(cpuCheckForValidMove()):
		#IF CPU HAS A VALID MOVE, IT WILL EITHER MOVE OR CHEAT+
		if(!toCheat):
			return(1)
		else:
			return(2)
	else:
		#IF NO VALID MOVE, IT WILL EITHER CHEAT OR PASS
		if(toCheat):
			return(3)
		else:
			return(4)

func cpuCheckForValidMove():
	#CHECK IF THEY HAVE A VALID CARD THEY CAN PLAY THIS TURN
	if(cpuNumOfValidMoves() <= 0):
		#IF HERE, THERE DO NOT HAVE ANY OF THE CARD IN PLAY
		#HAVE TO DECIDE IF IT SHOULD PASS OR PLAY
		return (false)
	else:
		#IF HERE, THEY HAVE AT LEAST ONE CARD TO PLAY
		return(true)

func cpuNumOfValidMoves():
	var myCardsOfVal = 0
	for x in cpuOneHand:
		var a = x
		var c = a.to_int()
		if(c == cardOfRound):
			myCardsOfVal += 1
	return(myCardsOfVal)

func cpuCallsBluff(bluffProc):
	#IF THE PLAYERS HAND IS NOW EMPTY, YOU HAVE TO CALL BLUFF OTHERWISE YOU LOSE
	#print(playerHand.size())
	if (playerHand.size() == 0):
		return(true)
	#OTHERWISE, RELY ON HISTORY AND KNOWLEDGE OF CURRENT HAND TO DETERMINE IF CPU SHOULD CALL BLUFF
	var myCardsOfVal = 0
	for x in cpuOneHand:
		var a = x
		var c = a.to_int()
		if(c == cardOfRound):
			myCardsOfVal += 1
	
	for x in cpuCardsLastRound:
		var a = x
		var c = a.to_int()
		if(c == cardOfRound):
			var toAdd = true
			for g in cpuOneHand:
				if(g == x):
					toAdd = false
			if(toAdd):
				myCardsOfVal += 1
	#print(myCardsOfVal)
	#print(cardCount)
	
	if((cardCount + myCardsOfVal) > 4):
		#print("CALLING BLUFF")
		return(true)
	else:
		#IF HERE, THE PLAYER PLAYED 4 OR LESS CARDS
		#COME UP WITH A RANDOM NUMBER T
		var t = rng.randi_range(0,100)
		#print(t)
		#NORMALIZE VALUE BASED ON ASSUMPTION 4 = 100
		var k = (float(cardCount + myCardsOfVal) / 4)
		#print(k)
		t *= k
		#print("New T")
		#print(t)
		#NOW t VALUE STILL MUST BE < 100, LIKELY ON LOWER SIDE
		#IF t is GREATER THAN BLUFFPROC, CPU WILL CALL BLUFF
		if(t > bluffProc):
			#print("CALLING BLUFF N")
			return(true)
		else:
			#print("NOT CALLING BLUFF")
			return(false)

func caughtBluffing(wasPlayer):
	if(wasPlayer):
		for x in centerHand:
			playerHand.push_back(x)
	else:
		for x in centerHand:
			cpuOneHand.push_back(x)
	centerHand = []
	realizeHands()


func incPshGge():
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
	
	# Load level-specific information
	### we can preload most of these for the time being since there is only 1 level
	# Load Paper Overlay shader
	#$Background.material.set_shader_parameter("overlay", preload("res://Assets/BunnyTable/Paper Texture Overlay.png"))

	#Calling to Add Players Cards to Hand
	realizeHands()
	"""PLAYING DIALOGUE"""
	Global.playDialogue("111a")
	"""PLAYING DIALOGUE"""


#Creates Card Nodes for player to see and interact with
func realizeHands():
	#for x in playerHand:
		#print(x)
	for x in playerCards.get_children():
		playerCards.remove_child(x)
		x.queue_free()
		
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
	cpuCardsLastRound = []
	
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
		# Need to add a timer
		get_tree().change_scene_to_file("res://Scenes/BunnyHeadspace.tscn")


func _on_song_start_finished():
	print("song finished playing")
	$Song_loop.play()  


func _on_barrel_button_pressed():
	selectorIndex += 1
	cardToBluff.get_node("TextLeft").text = cardSyms[selectorIndex  % 13]
	cardToBluff.get_node("TextCenter").text = cardSyms[(selectorIndex + 1) % 13]
	cardToBluff.get_node("TextRight").text = cardSyms[(selectorIndex + 2) % 13]
