# res://scripts/card_globals.gd
class_name CardGlobals

enum Suit { HEARTS, DIAMONDS, CLUBS, SPADES }
enum Rank {
	ACE = 1, TWO, THREE, FOUR, FIVE, SIX, SEVEN,
	EIGHT, NINE, TEN, JACK, QUEEN, KING
}

# card_globals.gd
static func suit_to_filename(suit: Suit) -> String:
	match suit:
		Suit.HEARTS: return "hearts"
		Suit.DIAMONDS: return "diamonds"
		Suit.CLUBS: return "clubs"
		Suit.SPADES: return "spades"
		_: return "unknown"

static func rank_to_filename(rank: Rank) -> String:
	match rank:
		Rank.ACE: return "ace"
		Rank.JACK: return "jack"
		Rank.QUEEN: return "queen"
		Rank.KING: return "king"
		_: return str(rank)  # "2".."10"
