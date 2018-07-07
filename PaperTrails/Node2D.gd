extends Node2D

var drawing = false
onready var ink_scene = preload("res://Ink.tscn")
var pos = Vector2(-128,-128)
var outOfSight = Vector2(-128,-128)
var rotatePoint = Vector2(-128,-128)
var rotateDegree
var updateRotation
var previewPos
var preview = false


func _physics_process(delta):
	$StaticBody2D.set_rotation((getFrom().angle_to_point(getTo())))
	if Input.is_action_pressed("ui_left"):
		print("from", getFrom())
		print("to", getTo())
		
func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			pos = event.get_position()
			print(pos)
			if !((pos.x > 540) && (pos.y < 60)):
				if ((pos.x > 150)):
#					#rotatePoint = event.get_position()
#					#rotateDegree = rotatePoint.angle()
#					#$StaticBody2D.set_rotation(rotateDegree)
#					#print(rotateDegree)
#					pass
					preview = true
		else:
			preview = false
			#spawn_ink(event.get_position().x + $Controller/Node2D2.get_global_position().x - 32, event.get_position().y - 32)

	if event is InputEventScreenDrag:
		rotatePoint = event.position
		
func getFrom():
	var from = rotatePoint
	from.x += $Controller.position.x - 320
	from.y -= 32
	return from
	
func getTo():
	var to = pos
	to.x += $Controller.position.x - 320
	to.y -= 32
	if preview == true:
		$StaticBody2D.position = to
	else:
		$StaticBody2D.position = outOfSight
	return to
			
func spawn_ink(x, y):
	var pos = Vector2(x, y)
	var ink = ink_scene.instance()
	ink.position = pos
	add_child(ink)

		