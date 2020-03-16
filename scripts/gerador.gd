extends Position2D



onready var tree = preload("res://scenes/tree.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()

func _on_Timer_timeout() -> void:
	var newtree = tree.instance()
	newtree.position_tree(position)
	get_parent().add_child(newtree)

