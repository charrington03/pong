class_name Ball
extends CharacterBody2D

var min_speed: int
var max_speed: int
var init_speed: int
var bounce_index: float
var direction: Vector2

var speed: int
var paused: bool

func _init():
	init_speed = GameSettings.init_ball_speed.val
	max_speed = GameSettings.max_ball_speed.val
	min_speed = GameSettings.min_ball_speed.val
	bounce_index = GameSettings.ball_bounce_index.val

func _ready():
	speed = init_speed
	direction = get_starting_direction()
	velocity = direction * speed

func _physics_process(delta):
	if (paused):
		return

	var collision = move_and_collide(velocity * delta)
	
	if collision:
		if collision.get_collider() is Paddle:
			collide_with_paddle(collision)
		if collision.get_collider() is Wall:
			collide_with_wall(collision)


func get_starting_direction() -> Vector2:
	var dir = [Vector2.LEFT, Vector2.RIGHT].pick_random()
	var angle = randf_range(deg_to_rad(-70), deg_to_rad(70))
	return dir.rotated(angle)


func collide_with_paddle(collision: KinematicCollision2D):
	var paddle = collision.get_collider() as Paddle
	# +y_diff is at top, -y_diff is at bottom of paddle
	var y_diff = paddle.position.y - position.y
	
	var bounce_force = paddle.get_bounce_force(y_diff) * bounce_index
	
	direction = velocity.bounce(collision.get_normal()).normalized()
	speed = min(max_speed, speed * bounce_force)
	velocity = direction * speed


func collide_with_wall(collision: KinematicCollision2D):
	var wall = collision.get_collider() as Wall
	
	direction = velocity.bounce(collision.get_normal()).normalized()
	speed = min(max_speed, speed * wall.bounce_index * bounce_index)
	velocity = direction * speed



