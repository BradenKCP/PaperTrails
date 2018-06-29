extends Camera2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -400

var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	motion.x = SPEED
	$Sprite.play("Run")
	
	#if Input.is_action_pressed("ui_right"):
		#motion.x = SPEED
		#$Sprite.flip_h = false
		#$Sprite.play("Run")
	#elif Input.is_action_pressed("ui_left"):
		#motion.x = -SPEED
		#$Sprite.flip_h = true
		#$Sprite.play("Run")
		
	if is_on_wall():
		$Sprite.play("Idle")
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
	else:
		if motion.y < 0:
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
	
	
	motion = move_and_slide(motion, UP)
	pass