extends Node2D

var drawing = false
onready var ink_scene = preload("res://Ink.tscn")

func _physics_process(delta):
	pass
		
func _input(event):
	if event is InputEventScreenTouch:
			var pos = event.get_position()
			if ((pos.x < 550) && (pos.y > 55)):
				if ((pos.x > 150)):
					spawn_ink(event.get_position().x + $Controller/Node2D2.get_global_position().x, event.get_position().y - 32)
					
func spawn_ink(x, y):
	var pos = Vector2(x, y)
	var ink = ink_scene.instance()
	ink.position = pos
	add_child(ink)
	
	