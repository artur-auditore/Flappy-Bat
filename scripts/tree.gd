extends Node2D

export var vel = -200
var cena
func _ready() -> void:
	cena = get_tree().get_current_scene()
	set_process(true)

func _process(delta: float) -> void:
	if  cena.estado == cena.JOGANDO:
		position = position + Vector2(vel * delta, 0)

	if position.x < -650:
		cena.GanhaPontos()
		queue_free()

func position_tree(pos) -> void:
	position = pos + Vector2(0,rand_range(-150,150))

func _on_Area2D_body_entered(body: Node) -> void:
	if body.name == "bat":
		cena.kill()
