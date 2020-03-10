extends RigidBody2D


func _ready() -> void:
	set_process_input(true)
	_physics_process(true)
	
func _physics_process(delta) -> void:
	if rad2deg(get_rotation()) > 30:
		set_rotation(deg2rad(30))
		
	if get_linear_velocity().y > 0:
		set_angular_velocity(1.5)

func flap():
	set_linear_velocity(Vector2(get_linear_velocity().x, -175))
	set_angular_velocity(-1)

func _input(event):
	if event.is_action_pressed("flap"):
		flap()
		
