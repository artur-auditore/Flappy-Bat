extends Node2D

onready var bat = get_node("bat")

var estado = 1

const JOGANDO = 1
const PERDENDO = 2

func _ready() -> void:
	pass # Replace with function body.

func kill():
	bat.apply_impulse(Vector2(0,0),Vector2(0,500))
	$AnimationPlayer.stop()
	$Trees/Gerador/Timer.stop()
	$bat/batanimation.stop()
	estado = PERDENDO
