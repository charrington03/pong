class_name Paddle
extends CharacterBody2D

@onready var Sprite = $Sprite2D

@export var up_action: String
@export var down_action: String

var speed: int
var bounce_index: float
var offset_bounce_index: float

var height: int
var width: int

func _init():
	speed = GameSettings.init_paddle_speed.val
	bounce_index = GameSettings.paddle_bounce_index.val
	offset_bounce_index = GameSettings.paddle_offset_bounce_index.val

func _ready():
	assert(up_action != null && down_action != null, "ERROR: Paddle controls not set")
	height = Sprite.get_rect().size.x
	width = Sprite.get_rect().size.y
	


func _physics_process(delta):
	var movement = Vector2.ZERO
	
	if Input.is_action_pressed(up_action) && Input.is_action_pressed(down_action):
		movement = Vector2.ZERO
	elif Input.is_action_pressed(up_action):
		movement = Vector2.UP
	elif Input.is_action_pressed(down_action):
		movement = Vector2.DOWN
	
	velocity = movement * speed
	move_and_slide()


func get_bounce_force(y_diff: float):
	return (1 + (abs(y_diff) ** offset_bounce_index)/height) * bounce_index
	
