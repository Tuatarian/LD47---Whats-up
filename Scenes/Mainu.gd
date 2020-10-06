extends Control



func _on_ButPl_pressed():
	$PlTimer.start(0.1)

func _on_PlTimer_timeout():
	get_tree().change_scene("res://Scenes/Lvl1.tscn")
