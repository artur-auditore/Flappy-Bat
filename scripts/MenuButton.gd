extends Button



func _on_MenuButton_pressed() -> void:
	get_tree().change_scene("res://scenes/intro.tscn")

func _on_bat_tree_exited() -> void:
	show()
