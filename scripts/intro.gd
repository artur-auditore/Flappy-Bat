extends Node2D




func _ready() -> void:
	pass # Replace with function body.

func _on_StartButton_pressed() -> void:
	get_tree().change_scene("res://scenes/game_stage.tscn")

