extends Node2D

export var vel = -150

func _ready() -> void:
	set_process(true)

func _process(delta: float) -> void:
	position = position + Vector2(vel * delta, 0)
	
	if position.x < -100:
		print("Destruido!")
		queue_free()

