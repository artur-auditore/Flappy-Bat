extends RigidBody2D

var velocity 
var bird_jump_angle : = -0.5
var bird_fall_angle : = 0.5
var bird_jump_speed : = -150 # bird's jump speed


func _ready() -> void:
	set_process_input(true)
	_physics_process(true)
	

func _physics_process(delta) -> void:
	if  get_rotation_degrees() < -40: # if the bird's angle is less than -40
		set_rotation_degrees(-40) # set it to -40
		set_angular_velocity(0) # reset bird_jump_angle to pervent angle bugs
	if get_linear_velocity().y > 0: # if the bird was falling
		set_angular_velocity(bird_fall_angle) # face down the bird

func flap():
	set_linear_velocity(Vector2(get_linear_velocity().x, bird_jump_speed)) # make the bird jump
#	set_linear_velocity(Vector2(get_linear_velocity().x, -180))
	set_angular_velocity(bird_jump_angle)
func _input(event):
	if event.is_action_pressed("flap"):
		flap()
