extends Node

# the dealer:
# 1) deals cards
# 2) runs game
# 3) pays out

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_deal_cards()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_run_game()
	_check_winner()
	pass

func _deal_cards() -> void:
	# while players have less than 2 cards each, deal a card to each player
	pass

func _run_game() -> void:
	
	return

func _check_winner() -> void:
	# if player is winner pay out
	return
