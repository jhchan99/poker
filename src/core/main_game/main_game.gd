class_name MainGame
extends Node

const CARD 		: String = "uid://dfuc6u71k3f06"
const TABLE		: String = "uid://bhnc738v0qa8l"

var card : Card = null

var _current_table : Node2D = null

# Game world root nodes
@onready var level_root 	: Node2D = $World/LevelRoot
@onready var entity_root	: Node2D = $World/EntityRoot
@onready var effect_root	: Node2D = $World/EffectRoot

# UI root nodes
@onready var hud_root  		: Control = $HudLayer/HudRoot
@onready var pause_root		: Control = $PauseLayer/PauseRoot
@onready var debug_root		: Control = $DebugLayer/DebugRoot


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_init_table()
	_init_card()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func _init_table() -> void:
	var table_scene : PackedScene = ResourceLoader.load(TABLE) as PackedScene
	if table_scene == null:
		push_error("Failed to load table scene" + TABLE)
		return
	_current_table = table_scene.instantiate() as Node2D
	level_root.add_child(_current_table)
	return

# instantiates the deck and adds it to the entity layer
func _init_card() -> void:
	var card_scene : PackedScene = load(CARD) as PackedScene
	if card_scene == null:
		push_error("Failed to load card scene" + CARD)
		return
	card = card_scene.instantiate() as Card
	entity_root.add_child(card)
	card.position = get_viewport().get_visible_rect().size / 2
	return
