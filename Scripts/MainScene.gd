extends Node2D

func _ready():
	#Setting Global Main Parent Node to Be Self
	Global.m_parent = self
	
	
	#Recognizing new Scene to play Bluff
	var genBluff = load("res://Scenes/Bluff.tscn")
	
	#Creating a new instance of bluff to play game
	var initBluff = genBluff.instantiate()
	
	#Adding Bluff instance to Main Tree
	add_child(initBluff)
	
	#Initializing a new Game 
	initBluff.initGame(2)


func _process(delta):
	pass



func _exit_tree():
	Global.m_parent = null
