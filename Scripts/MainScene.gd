extends Node2D

var initWorld
var initBluff

func _ready():
	#Setting Global Main Parent Node to Be Self
	Global.m_parent = self
	#Recognizing new Scene for Overworld
	var genWorld = load("res://Scenes/Overworld.tscn")
	
	#Creating a new instance of overworld to enter
	initWorld = genWorld.instantiate()
	
	#Adding Bluff instance to Main Tree
	add_child(initWorld)
	initWorld.name = "World"


func _process(delta):
	pass

func continueGame():
	initBluff.dontDisplay = false

func _exit_tree():
	Global.m_parent = null

func startBluff(character):
	# Remove overworld
	initWorld.queue_free()
	#Recognizing new Scene to play Bluff
	var genBluff = load("res://Scenes/Bluff.tscn")
	
	#Creating a new instance of bluff to play game
	initBluff = genBluff.instantiate()
	
	#Adding Bluff instance to Main Tree
	add_child(initBluff)
	initBluff.name = "Bluff"
	
	#Initializing a new Game 
	initBluff.initGame(2)
