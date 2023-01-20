extends KinematicBody2D
export var bullet_speed = 1000
var can_fire = true
var gravity := 70
var direction := Vector2.ZERO
var rotate_bullet = 0
onready var bullet = preload("res://scenes/Bullet.tscn")


func _physics_process(_delta):
	move()
func _process(delta):
	shoot($AnimatedSprite.flip_h)
	direction = move_and_slide(direction, Vector2.UP)
	
func shoot(dir):
	if Input.is_action_just_pressed("shoot2"):
		var bullet_instance = bullet.instance()
		if $AnimatedSprite.flip_h:
			rotate_bullet = PI
			bullet_instance.position = $BulletPointLeft.get_global_position()
		else:
			rotate_bullet = 0
			bullet_instance.position = $BulletPointRight.get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation+rotate_bullet))
		get_tree().get_root().add_child(bullet_instance)
		can_fire = false
		yield(get_tree().create_timer(0.2) , "timeout")
		can_fire = true

		
	#get_parent().add_child(b)
		#b.global_position = $Position2D.global_position
func on_Area2D_area_entered():
	queue_free()
	print("Dest")
func move():
	if not is_on_floor():
		gravity += 10
	if Input.is_action_pressed ('right2'):
		direction.x = 150
		$Position2D.position.x = 15
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play('run p2')
	elif Input.is_action_pressed('left2'):
		direction.x = -150
		$Position2D.position.x = -15
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play('run p2')
	else:
		$AnimatedSprite.play("default p2")
		direction.x = 0
	if Input.is_action_just_pressed('up2') and is_on_floor():
		gravity = -300
	direction.y = gravity
