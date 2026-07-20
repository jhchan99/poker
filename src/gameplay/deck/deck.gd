# deck.gd
class_name Deck
extends Node

func build_deck(card_scene: PackedScene, parent: Node) -> Array[Card]:
	var cards: Array[Card] = []
	for suit in CardGlobals.Suit.values():
		for rank in CardGlobals.Rank.values():
			var card := card_scene.instantiate() as Card
			parent.add_child(card)
			card.setup(suit, rank)
			cards.append(card)
	return cards
