extends RigidBody2D

var cena

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global.register_owl(self)
	cena = get_tree().get_current_scene()

func _process(delta: float) -> void:
	set_linear_velocity(Vector2(-200 * 1.5, 0))

func _on_Area2D_body_entered(body: Node) -> void:
	if body.name == "bat":
		cena.kill()
