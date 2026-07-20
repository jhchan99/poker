class_name Card
extends Node2D

# cards have
	# 1) physics
	# 2) suit and number

const CARD_ART_PATH := "res://assets/cards/PNG-cards-1.3/"
	
var suit: CardGlobals.Suit
var rank: CardGlobals.Rank

@onready var panel: ColorRect = $Panel
@onready var label: Label = $Panel/RankSuiteLabel
@onready var texture_rect: TextureRect = $Panel/CardTexture



var card_being_dragged
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if card_being_dragged:
		var mouse_pos = get_global_mouse_position()
		card_being_dragged.position = Vector2(clamp(mouse_pos.x, 0, screen_size.x),
			clamp(mouse_pos.y, 0, screen_size.y))

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			var card = raycast_check_for_card()
			if card:
				card_being_dragged = card
		else:
			card_being_dragged = null

func raycast_check_for_card():
	var space_state = get_world_2d().direct_space_state
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = get_global_mouse_position()
	parameters.collide_with_areas = true
	parameters.collision_mask = 1
	var result	= space_state.intersect_point(parameters)
	if result.size() > 0:
		return result[0].collider.get_parent()
	return null 

func setup(p_suit: CardGlobals.Suit, p_rank: CardGlobals.Rank) -> void:
	suit = p_suit
	rank = p_rank
	update_visual()
	

	
func update_visual() -> void:
	var filename := "%s_of_%s.png" % [
		CardGlobals.rank_to_filename(rank),
		CardGlobals.suit_to_filename(suit)
	]
	var path := CARD_ART_PATH + filename
	var tex := load(path) as Texture2D

	if tex == null:
		push_error("Missing card texture: " + path)
		return

	texture_rect.texture = tex
