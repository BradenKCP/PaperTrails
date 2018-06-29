extends Area2D

var count = 0

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			count += 1
	if count == 0:
		get_tree().change_scene("res://StartMenu.tscn")
	count = 0
		
		
