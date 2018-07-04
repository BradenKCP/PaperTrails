extends Node2D

var drawing = false
onready var ink_scene = preload("res://Ink.tscn")

func _physics_process(delta):
	
	if Input.is_action_just_pressed("ui_up"):
		if ((get_viewport().get_mouse_position().x < 550) && (get_viewport().get_mouse_position().y > 55)):
			if ((get_viewport().get_mouse_position().x > 150)):
				drawing = true
				spawn_ink(get_local_mouse_position().x, get_local_mouse_position().y)
	if Input.is_action_just_released("ui_up"):
		drawing = false
	if drawing:
		pass
		
func spawn_ink(x, y):
	var pos = Vector2(x, y)
	var ink = ink_scene.instance()
	ink.position = pos
	add_child(ink)
	