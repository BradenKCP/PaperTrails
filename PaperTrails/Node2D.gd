extends Node2D

var drawing = false
onready var ink_scene = preload("res://Ink.tscn")
var pos = Vector2(-128,-128)
var outOfSight = Vector2(-128,-128)
var rotatePoint = Vector2(-128,-128)
var rotateDegree = 0
var updateRotation
var preview = false
var inkSpawnLocation
var spawn = true


func _physics_process(delta):
	$StaticBody2D.set_rotation((getTo().angle_to_point(getFrom())))
	rotateDegree = getFrom().angle_to_point(getTo())
		
func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			pos = event.position
			if in_bounds(pos):
				preview = true
				spawn = false
			else:
				spawn = true
		else:
			preview = false
			if spawn == false:
				spawn_ink(getFrom().x, getFrom().y)
				

	if event is InputEventScreenDrag:
		rotatePoint = event.position
		
func getFrom():
	var from = pos
	from.x += $Controller.position.x - 320
	from.y -= 32
	return from
	
func getTo():
	var to = rotatePoint
	to.x += $Controller.position.x - 320
	to.y -= 32
	if preview == true:
		$StaticBody2D.position = getFrom()
	else:
		$StaticBody2D.position = outOfSight
	return to
			
func spawn_ink(x, y):
	var ink = ink_scene.instance()
	ink.position = getFrom()
	ink.rotation = rotateDegree
	add_child(ink)
	
func in_bounds(place):
	if !((place.x > 540) && (place.y < 60)):
			if ((place.x > 150)):
				return true
	else:
		return false
	

		