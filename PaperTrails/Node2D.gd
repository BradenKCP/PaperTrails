extends Node2D

var drawing = false
onready var ink_scene = preload("res://Ink.tscn")
var pos = Vector2(0,0)
var origin = Vector2(0,0)
var rotatePoint = Vector2(0,0)
var rotateDegree
var updateRotation

func _physics_process(delta):
	$StaticBody2D.set_rotation((getFrom().angle_to(getTo())))
		
func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			pos = event.get_position()
			if ((pos.x < 550) && (pos.y > 55)):
				if ((pos.x > 150)):
					#rotatePoint = event.get_position()
					#rotateDegree = rotatePoint.angle()
					#$StaticBody2D.set_rotation(rotateDegree)
					$StaticBody2D.position = pos
					#print(rotateDegree)
		else:
			$StaticBody2D.position = origin
			#spawn_ink(event.get_position().x + $Controller/Node2D2.get_global_position().x - 32, event.get_position().y - 32)

	if event is InputEventScreenDrag:
		rotatePoint = event.position
		
func getTo():
	var to = rotatePoint
	to.x += $Controller/Node2D2.get_global_position().x - 32
	to.y -= 32
	return to
	
func getFrom():
	var from = pos
	from.x += $Controller/Node2D2.get_global_position().x - 32
	from.y -= 32
	return from
			
func spawn_ink(x, y):
	var pos = Vector2(x, y)
	var ink = ink_scene.instance()
	ink.position = pos
	add_child(ink)

		