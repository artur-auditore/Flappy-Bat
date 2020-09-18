extends RigidBody2D


var velocity 
func _ready() -> void:
	set_process_input(true)
	_physics_process(true)
	

func _physics_process(delta) -> void:
	pass

func flap():
	set_linear_velocity(Vector2(get_linear_velocity().x, -180))
func _input(event):
	if event.is_action_pressed("flap"):
		flap()
