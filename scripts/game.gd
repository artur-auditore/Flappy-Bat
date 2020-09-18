extends Node2D
onready var bat = get_node("bat")
onready var random = RandomNumberGenerator.new()
onready var back_day =  preload("res://background_day.png")
onready var back_cave = preload("res://background_cav.png")


func _ready() -> void:
	random.randomize()
	choose_stage()
	print(global.stage_number)
	global.estado_arvore = global.JOGANDO
	global.score = 0
	global.vel = -200
	

func show_message(text):
	$Message.text = text
	$Message.show()
	
func Pontua() -> void:
	global.score += 1
	$Score.text = str(global.score)

func kill():
	$bat.queue_free()
	$Trees/Gerador/Timer.stop()
	$bat/batanimation.stop()
	global.estado_arvore = global.PERDENDO
	show_message("Game Over")

func choose_stage():
	global.stage_number = random.randi_range(0,1)
	if global.stage_number == 0:
		#global.estado_arvore = global.JOGANDO
		$world.set_texture(back_day)
		$world.scale.x = 7.0
		$world.scale.y = 2.34
	elif global.stage_number == 1:
		#global.estado_arvore = global.PERDENDO
		#$Trees.visible = false
		$world.set_texture(back_cave)
		
