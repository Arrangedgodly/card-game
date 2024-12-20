extends Node2D

var cards = []
const CARD = preload("res://scenes/card.tscn")

func _ready():
	load_card_scenes()
	instantiate_cards()

func load_card_scenes():
	var dir = DirAccess.open("res://scenes/cards")
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		
		while file_name != "":
			if file_name.ends_with(".tscn"):
				var scene = load("res://scenes/cards/" + file_name)
				cards.append(scene)
			file_name = dir.get_next()
			
		dir.list_dir_end()
	
func instantiate_cards():
	for card in cards:
		var card_instance = CARD.instantiate()
		var card_face = card.instantiate()
		card_instance.add_child(card_face)
		add_child(card_instance)
