extends Node2D

export var suit = String()
export var value = int()

var row = 0

var card_path

func _ready():
	find_sprite()
	pass

func find_sprite():
	if suit == "hearts":
		card_path = "res://Assets/Sprites/Cards/Hearts/"
	elif suit == "spades":
		card_path = "res://Assets/Sprites/Cards/Spades/"
	elif suit == "diamonds":
		card_path = "res://Assets/Sprites/Cards/Diamonds/"
	elif suit == "flowers":
		card_path = "res://Assets/Sprites/Cards/Flowers/"
	else: print("suit is not assigned correctly, try changing it to 'hearts', 'spades', 'diamonds' or 'flowers'"); pass
	
	if card_path != null && suit != null: $Sprite.texture = load(card_path + String(value) + ".png")
	else: $Sprite.texture = load("res://Assets/Sprites/Cards/back.png")

func adjust_z_index():
	z_index = row