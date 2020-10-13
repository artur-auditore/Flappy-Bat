extends Node2D
onready var random = RandomNumberGenerator.new()
onready var back_day =  preload("res://background_day.png")
onready var back_nat_noite = preload("res://natureza_noite.jpg")
onready var owl = preload("res://scenes/owl.tscn")
signal recorde

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
	$OwlTimer.stop()
	$Trees/Gerador/Timer.stop()
	$bat/batanimation.stop()
	global.estado_arvore = global.PERDENDO
	$cntr_gameover.show()
	$cntr_gameover/panel_score/score_final.text = str(global.score)
	if global.score > global.best_score:
		global.best_score = global.score
	$cntr_gameover/panel_score/best_score.text = str(global.best_score)

func choose_stage():
	global.stage_number = random.randi_range(0,1)
	if global.stage_number == 0:
		#global.estado_arvore = global.JOGANDO
		$world.set_texture(back_day)
		$world.scale.x = 7.0
		$world.scale.y = 2.34
	elif global.stage_number == 1:		#global.estado_arvore = global.PERDENDO
		#$Trees.visible = false
		$world.set_texture(back_nat_noite)
		$world.scale.x = 0.47
		$world.scale.y = 0.42
		$OwlTimer.start()

func _on_OwlTimer_timeout() -> void:
	$OwlPath/OwlSpawnLocation.set_offset(randi())
	var newowl = owl.instance()
	add_child(newowl)
	newowl.position = $OwlPath/OwlSpawnLocation.position

	
