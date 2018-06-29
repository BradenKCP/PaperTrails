extends KinematicBody2D

const SPEED = 200
var PAUSE = false

var motion = Vector2()

func _physics_process(delta):
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
	PAUSE = true
