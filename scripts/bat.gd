extends RigidBody2D

var cena 

func _ready() -> void:
	set_process_input(true)
	_physics_process(true)
	cena = get_tree().get_current_scene()

func _physics_process(delta) -> void:
	pass

func flap():
	set_linear_velocity(Vector2(get_linear_velocity().x, -180))

func _input(event):
	if event.is_action_pressed("flap") and cena.estado == cena.JOGANDO:
		flap()
