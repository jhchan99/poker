class_name MainGame
extends Node

const CARD : String = "uid://dfuc6u71k3f06"


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
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
