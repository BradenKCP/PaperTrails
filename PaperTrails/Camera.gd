extends KinematicBody2D

const SPEED = 200
var PAUSED = false

var motion = Vector2()

func _physics_process(delta):
	if PAUSED:
		SPEED = 0
	else:
		SPEED = 200
	motion.x = SPEED
	
	
	#if Input.is_action_pressed("ui_right"):
		#motion.x = SPEED
		#$Sprite.flip_h = false
		#$Sprite.play("Run")
	#elif Input.is_action_pressed("ui_left"):
		#motion.x = -SPEED
		#$Sprite.flip_h = true
		#$Sprite.play("Run")
	
	motion = move_and_slide(motion)
	pass

func _on_Button_pressed():
	if PAUSED:
		PAUSED = false
		$Control/CenterContainer/Pause.set_text("Pause")
		get_tree().set_pause(false)
	else:
		PAUSED = true
		$Control/CenterContainer/Pause.set_text("UnPause")
		get_tree().set_pause(true)
		
	

