extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -410
var canJump
var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	motion.x = SPEED
	canJump = true
	
	$Sprite.play("Run")
		
	if is_on_wall():
		$Sprite.play("Idle")
		
	if is_on_floor():
		pass
	else:
		if motion.y < 0:
			$Sprite.play("Jump")
			canJump = false
		else:
			$Sprite.play("Fall")
			canJump = false
	
	motion = move_and_slide(motion, UP)
	pass

func _input(event):
	if event is InputEventScreenTouch:
		if canJump == true:
			var pos = event.get_position()
			if !((pos.x > 550) && (pos.y < 55)):
				if ((pos.x < 150)):
					motion.y = JUMP_HEIGHT