extends Node2D


#VARIABLES
var rng


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


func newNode(node, location, _parent, scaleMult):
	var newNode = node.instance()
	_parent.add_child(newNode)
	newNode.global_position = location
	newNode.scale *= scaleMult
	return newNode
