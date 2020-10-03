extends RigidBody2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global.register_owl(self)

func _process(delta: float) -> void:
	set_linear_velocity(Vector2(-200 * 1.5, 0))

