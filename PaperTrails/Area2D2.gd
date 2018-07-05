extends Area2D

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_up"):
		var touchPos = getPosition()
		print(touchPos)
		
func getPosition():
	var pos = InputEventScreenTouch.get_position()
	return pos