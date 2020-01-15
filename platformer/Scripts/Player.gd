extends KinematicBody2D

const SPEED = 75
const GRAVITY = 10
const JUMP_POWER = -350
const FLOOR = Vector2(0, -1)
const FIREBALL = preload("res://Fireball.tscn")

var velocity = Vector2()
var on_ground = false

var is_dead = false

func _physics_process(delta):
	
	if is_dead == false:
		if Input.is_action_pressed("ui_right"):
			right()
		elif Input.is_action_pressed("ui_left"):
			left()
		else:
			none()
		if Input.is_action_pressed("ui_up"):
			jump()
		if Input.is_action_just_pressed("ui_focus_next"):
			shoot()
			
			
		velocity.y += GRAVITY
		
		if is_on_floor():
			on_ground = true
		else:
			on_ground = false
			$AnimatedSprite.play("idle")
			
		velocity = move_and_slide(velocity, FLOOR)
		
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Enemy" in get_slide_collision(i).collider.name:
					dead()
				if "Spikeball" in get_slide_collision(i).collider.name:
					dead()
				if "Arrow" in get_slide_collision(i).collider.name:
					dead()
				if "Vertical" in get_slide_collision(i).collider.name:
					dead()
	
		
func dead():
	is_dead = true
	velocity = Vector2(0, 0)
	get_tree().change_scene("dead.tscn")
	
func right():
	velocity.x = SPEED
	$AnimatedSprite.play("walking")
	$AnimatedSprite.flip_h = false
	if sign($Position2D.position.x) == -1:
		$Position2D.position.x *= -1
				
func left():
	velocity.x = -SPEED
	$AnimatedSprite.play("walking")
	$AnimatedSprite.flip_h = true
	if sign($Position2D.position.x) == 1:
		$Position2D.position.x *= -1
				
func none():
	velocity.x = 0
	$AnimatedSprite.play("idle")
	
func jump():
	if on_ground == true:
		velocity.y = JUMP_POWER
		on_ground = false
		
func shoot():
	var fireball = FIREBALL.instance()
	if sign($Position2D.position.x) == 1:
		fireball.set_fireball_direction(1)
	else:
		fireball.set_fireball_direction(-1)
	get_parent().add_child(fireball)
	fireball.position = $Position2D.global_position


