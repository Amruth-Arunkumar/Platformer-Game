extends KinematicBody2D

const GRAVITY = 10
const SPEED = 30
const FLOOR = Vector2(0, -1)

var velocity = Vector2()

var direction = 1

var is_dead = false

func _ready():
	pass
	
func dead():
	is_dead = true
	velocity = Vector2(0, 0)
	queue_free()

func _physics_process(delta):
	if is_dead == false:
		velocity.y = SPEED * direction
			
		$AnimatedSprite.play("walk")
		velocity = move_and_slide(velocity, FLOOR)
	
	if is_on_floor():
		direction = direction * -1
	if is_on_ceiling():
		direction = direction * -1
	
	if get_slide_count() > 0:
		for i in range(get_slide_count()):
			if "Player" in get_slide_collision(i).collider.name:
				get_slide_collision(i).collider.dead()
