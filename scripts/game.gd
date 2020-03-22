extends Node2D

onready var bat = get_node("bat")
export (PackedScene) var Arvore

var estado = 1
var score = 0
const JOGANDO = 1
const PERDENDO = 2

func _ready() -> void:
	randomize() 

func GanhaPontos() -> void:
		score +=1
		$Score.text = str(score)

func show_message(text):
	$Message.text = text
	$Message.show()

func kill():
	bat.apply_impulse(Vector2(0,0),Vector2(0,500))
	$Trees/Gerador/Timer.stop()
	$bat/batanimation.stop()
	estado = PERDENDO
	show_message("Game Over")


