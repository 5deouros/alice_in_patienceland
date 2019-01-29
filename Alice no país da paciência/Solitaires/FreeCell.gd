extends Node

var card_sort_id = 1

var column = 0
var line_y = 0

func _ready():
	draw_cards()
	pass

func draw_cards():
	while card_sort_id < 11:
		var card = load("res://Scenes/Card.tscn")
		var node = card.instance()
		node.suit = "spades"
		node.value = card_sort_id
		$Cards.add_child(node, true)
		card_sort_id += 1
		pass
		
	var cards_array = $Cards.get_children()
	print(cards_array)
	
	for card_id in cards_array:
		card_id.position = give_position()
		print(card_id.suit)
		print(card_id.value)

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
		line_y += 100
		return $Positions/P8.position + Vector2 (0, old_y)