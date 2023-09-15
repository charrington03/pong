extends Node2D

@export var BALL_INSET: int = 100

@onready var ball = $Ball

func _ready():
	randomize_ball()
	ball.paused = false
	

func randomize_ball():
	var viewport_size = get_viewport_rect().size
	
	var rand_x = randi_range(BALL_INSET, viewport_size.x - BALL_INSET)
	var rand_y = randi_range(BALL_INSET, viewport_size.y - BALL_INSET)
	ball.position = Vector2(rand_x, rand_y)
	
	var rand_direction = Vector2.UP.rotated(randf_range(0, 2*PI))
	ball.direction = rand_direction
