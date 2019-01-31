extends Node

var card_sort_id = 0
var card_sort_suit = 0
var card_sort_value = 1

var column = 0
var line_y = 0

export var deal_number = int()

func _ready():
	generate_cards()
	pass

func generate_cards():
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
	var cards_dic = {}
	var idx = 0
	
	var new_array = cards_array
	var n = cards_array.size()
	
	while n != 0:
		cards_dic[idx] = new_array.front()
		new_array.pop_front()
		idx += 1
		n -= 1
	
	draw_cards(deal_number, cards_dic)
	

func update_values():
	if card_sort_suit == 3:
		card_sort_suit = 0
		card_sort_value += 1
	else: card_sort_suit += 1

func get_suit():
	if card_sort_suit == 0:
		return "flowers"
	elif card_sort_suit == 1:
		return "diamonds"
	elif card_sort_suit == 2:
		return "hearts"
	elif card_sort_suit == 3:
		return "spades"
	else:
		print ("card_sort_suit has a wrong index assigned")
		return null
	pass

func get_position():
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

func rng(_seed):
	var state = (214013 * _seed + 2531011) % 2147483648
	return state / 65536
	pass

func draw_cards(deal_number, cards_dic):
	var _seed = deal_number
	var new_dic = cards_dic
	while new_dic.size() != 0:
		var index = rng(_seed) % cards_dic.size()
		var current_card = new_dic[index]
		new_dic[index] = new_dic[new_dic.size() - 1]
		new_dic.erase(new_dic.size() - 1)
		deal_card(current_card)
		_seed = rng(_seed)
	pass

func deal_card(card):
	card.position = get_position()
	pass



