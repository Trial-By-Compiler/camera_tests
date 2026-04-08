extends CharacterBody2D

@export var speed = 400
@export var rotation_speed = 1.5

#@onready var _animated_sprite = $PlayerAnimation

var rotation_direction = 0


#input grabs
func get_input():
	#below is four way movement control
	#var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#velocity = (input_direction * speed)
	velocity = transform.y * Input.get_axis("ui_up", "ui_down") * speed

	#below is rotational movement control
	rotation_direction = Input.get_axis("ui_left", "ui_right")

	#Future CODE:
	#forward should go fastest, backwards should be slower, and sides should be in the middle

#movement tells
func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	

	#if Input.is_action_pressed("forward"):
		#_animated_sprite.play("forward")
	#else:
		#_animated_sprite.stop()

	move_and_slide()
