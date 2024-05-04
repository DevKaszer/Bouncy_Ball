extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

const SPEED = 200.0
const JUMP_VELOCITY = -200.0
var direction = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity : Vector2 = Vector2(0,9.89)

func _ready():
	animated_sprite.play("idle")


func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity.y * 0.5
		animated_sprite.play("jump")

	# Handle jump.
	if is_on_floor():
		if Input.is_key_pressed(KEY_SPACE):
			velocity.y = JUMP_VELOCITY
		animated_sprite.play("idle")			
		
	if Input.is_key_pressed(KEY_A):
		direction = -1
	elif Input.is_key_pressed(KEY_D):
		direction = 1
	else:
		direction = 0
	velocity.x = SPEED * direction * (delta * 30)

	move_and_slide()
