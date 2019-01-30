extends Node

var card_sort_id = 0
var card_sort_suit = 0
var card_sort_value = 1

var column = 0
var line_y = 0

func _ready():
	draw_cards()
	pass

func draw_cards():
	while card_sort_id < 52:
		var card = load("res://Scenes/Card.tscn")
		var node = card.instance()
		node.set_name("Card" + String(card_sort_id))
		node.suit = get_suit()
		node.value = card_sort_value
		$Cards.add_child(node, true)
		card_sort_id += 1
		update_values()
		
		
	var cards_array = $Cards.get_children()
	print(cards_array)
	
	for card_id in cards_array:
		card_id.position = give_position()
		print(card_id.suit)
		print(card_id.value)

func update_values():
	if card_sort_value == 13:
		card_sort_value = 1
		card_sort_suit += 1
	else: card_sort_value += 1

func get_suit():
	if card_sort_suit == 0:
		return "hearts"
	elif card_sort_suit == 1:
		return "spades"
	elif card_sort_suit == 2:
		return "diamonds"
	elif card_sort_suit == 3:
		return "flowers"
	else:
		print ("card_sort_suit has a wrong index assigned")
		return null
	pass

func give_position():
	if column == 0:
		column += 1
		return $Positions/P1.position + Vector2 (0, line_y)
	elif column == 1:
		column += 1
		return $Positions/P2.position + Vector2 (0, line_y)
	elif column == 2:
		column += 1
		return $Positions/P3.position + Vector2 (0, line_y)
	elif column == 3:
		column += 1
		return $Positions/P4.position + Vector2 (0, line_y)
	elif column == 4:
		column += 1
		return $Positions/P5.position + Vector2 (0, line_y)
	elif column == 5:
		column += 1
		return $Positions/P6.position + Vector2 (0, line_y)
	elif column == 6:
		column += 1
		return $Positions/P7.position + Vector2 (0, line_y)
	elif column == 7:
		column = 0
		var old_y = line_y
		line_y += 50
		return $Positions/P8.position + Vector2 (0, old_y)