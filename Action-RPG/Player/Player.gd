extends KinematicBody2D

const ACCELERATION = 5
const MAX_SPEED = 75
const FRICTION = 5

var velocity = Vector2.ZERO

func _physics_process(delta):
#	print(delta) # need to use delta?
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION )
#		velocity +=  input_vector * ACCELERATION * delta
#		velocity = velocity.clamped(MAX_SPEED)
	else:
		velocity = velocity.move_toward(Vector2.ZERO,  FRICTION )
#		velocity = Vector2.ZERO
	
#	if Input.is_action_pressed("ui_right"):
#		velocity.x = 4
#	elif Input.is_action_pressed("ui_left"):
#		velocity.x = -4
#	elif Input.is_action_pressed("ui_up"):
#		velocity.y = -4
#	elif Input.is_action_pressed("ui_down"):
#		velocity.y = 4
#	else:
#		velocity.x = 0
#		velocity.y = 0

#	move_and_collide(velocity * delta)
	velocity = move_and_slide(velocity)
