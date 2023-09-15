extends Node2D

const BallScn = preload("res://ball/ball.tscn")
const WinScn = preload("res://game/win_overlay/win_overlay.tscn")
const MainMenuScn = preload("res://main_menu/main_menu.tscn")

@onready var LeftScoreLabel = $ScoreLabelLeft
@onready var RightScoreLabel = $ScoreLabelRight
@onready var LeftPaddle = $PaddleLeft
@onready var RightPaddle = $PaddleRight
@onready var LeftGoal = $GoalLeft
@onready var RightGoal = $GoalRight
@onready var Walls = $Walls

var GameBall: Ball

@export var paddle_inset: int = 100

var points_to_win := 11
var left_score := 0
var right_score := 0
var winner = null


func _init():
	self.points_to_win = Global.points_to_win


func _ready():
	LeftGoal.connect("ball_entered", score_right)
	RightGoal.connect("ball_entered", score_left)

	LeftPaddle.position = Vector2(paddle_inset, get_center().y)
	RightPaddle.position = Vector2(get_viewport_rect().size.x - paddle_inset, get_center().y)
	
	GameBall = new_ball()
	GameBall.paused = true
	self.add_child(GameBall)
	await get_tree().create_timer(1.0).timeout
	GameBall.paused = false
	

func get_center() -> Vector2:
	return self.get_viewport_rect().size / 2


func score_left():
	left_score += 1
	LeftScoreLabel.text = str(left_score)
	on_score()


func score_right():
	right_score += 1
	RightScoreLabel.text = str(right_score)
	on_score()


func on_score():
	GameBall.queue_free()
	
	if check_win():
		return
	
	GameBall = new_ball()
	self.add_child(GameBall)
	reset_paddle_pos()
	
	# wait before restarting
	await get_tree().create_timer(1.0).timeout
	
	GameBall.paused = false


func reset_paddle_pos():
	LeftPaddle.position = Vector2(paddle_inset, get_center().y)
	RightPaddle.position = Vector2(get_viewport_rect().size.x - paddle_inset, get_center().y)


func new_ball():
	var NewBall = BallScn.instantiate()
	NewBall.position = get_center()
	return NewBall


func check_win() -> bool:
	if (left_score >= points_to_win):
		on_win("Left")
		return true
		
	elif (right_score >= points_to_win):
		on_win("Right")
		return true
		
	return false


func on_win(winner: String):
	Global.winner_name = winner
	var WinOverlay = WinScn.instantiate()
	add_child(WinOverlay)








