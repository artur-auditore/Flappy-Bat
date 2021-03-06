extends Node2D
onready var trees =  preload("res://Tree_Big_1.png")
onready var pine = preload("res://pine_tree.png")
var cena


func _ready() -> void:
	cena = get_tree().get_current_scene()
	set_process(true)
	get_blocker()

func _process(delta: float) -> void:
	if global.estado_arvore == global.JOGANDO:
		position = position + Vector2(global.vel * delta, 0)

	if position.x < -650:
		queue_free()

func position_tree(pos) -> void:
	if global.estado_arvore == global.JOGANDO:
		position = pos + Vector2(0,rand_range(-150,150))

func _on_Area2D_body_entered(body: Node) -> void:
	if body.name == "bat":
		cena.kill()

func _on_Barreira_body_entered(body: Node) -> void:
	if body.name == "bat":
		cena.Pontua()

func get_blocker():
	if global.stage_number == 0:
		$Sprite.set_texture(trees)
		$Sprite2.set_texture(trees)
		$Sprite.position.y = 72
		$Sprite2.position.y = -72
		$Sprite.scale.x = 0.05
		$Sprite.scale.y = 0.05
		$Sprite2.scale.x = 0.05
		$Sprite2.scale.y = 0.05
	elif global.stage_number == 1:
		$Sprite.set_texture(pine)
		$Sprite2.set_texture(pine)
		$Sprite.position.y = 67
		$Sprite2.position.y = -67
		$Sprite.scale.x = 0.05
		$Sprite.scale.y = 0.05
		$Sprite2.scale.x = 0.05
		$Sprite2.scale.y = 0.05
