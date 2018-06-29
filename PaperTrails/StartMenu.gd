#StartMenu.gd
extends Control


func _on_startGameButton_pressed():
	get_tree().change_scene("res://World.tscn")


func _on_quitGameButton_pressed():
	get_tree().quit()
