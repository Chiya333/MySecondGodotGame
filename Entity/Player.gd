extends Node2D

var MAX_SPEED = 20
var ACCELERATION = 5
var FRICTION = 5
#var GRAVITY = Vector2(0, 5)

@onready var Player = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	#input_vector.y = Input.get_action_strength("ui_down")
	input_vector = input_vector.normalized()
	
	#velocity = velocity.move_toward(GRAVITY, GRAVITY)
	print("H")
	if input_vector != Vector2.ZERO:# Go
		Player.play("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:# Stop
		Player.play("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	move_and_slide()
