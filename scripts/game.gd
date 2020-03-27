extends Node2D

onready var bat = get_node("bat")

var estado = 1
var score = 0
const JOGANDO = 1
const PERDENDO = 2

func _ready() -> void:
	randomize() 

func show_message(text):
	$Message.text = text
	$Message.show()
	
func Pontua() -> void:
	score += 1
	$Score.text = str(score)

func kill():
	$bat.queue_free()
	$Trees/Gerador/Timer.stop()
	$bat/batanimation.stop()
	estado = PERDENDO
	show_message("Game Over")
	
