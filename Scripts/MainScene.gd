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
	if(initBluff != null):
		if(!initBluff.noWinner):
			var stress = initBluff.stressLevel
			initBluff.queue_free()
			#Recognizing new Scene to play Bluff
			var genBluff = load("res://Scenes/Bluff.tscn")
		
			#Creating a new instance of bluff to play game
			initBluff = genBluff.instantiate()
			#Adding Bluff instance to Main Tree
			add_child(initBluff)
			initBluff.name = "Bluff"
		
			#Initializing a new Game 
			initBluff.initGame()
			initBluff.updateStress(stress)
			initBluff.dontDisplay = false

func continueGame():
	initBluff.dontDisplay = false
	
func stopGame():
	initBluff.dontDisplay = true

func _exit_tree():
	Global.m_parent = null

func startBluff(character):
	if is_instance_valid(initWorld):
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
	initBluff.initGame()
	Global.init_dialogue()	
	Global.playDialogue("111a")
