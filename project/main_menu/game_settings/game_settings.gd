class_name GameSettings
extends Object

# Player Names
static var left_player_name = GameSetting.new("Left Player Name", "Left")
static var right_player_name = GameSetting.new("Right Player Name", "Right")

# Ball Settings
static var init_ball_speed = GameSetting.new("Initial Ball Speed", 300, 1, 5000)
static var max_ball_speed = GameSetting.new("Max Ball Speed", 1000, 1, 5000)
static var min_ball_speed = GameSetting.new("Min Ball Speed", 50, 1, 5000)
static var ball_bounce_index = GameSetting.new("Ball Bounce Index", 1.0, -3.0, 3.0)

# Paddle Settings
static var init_paddle_speed = GameSetting.new("Paddle Speed", 600, 1, 5000)
static var paddle_bounce_index = GameSetting.new("Paddle Bounce Index", 1.0, -3.0, 3.0)
static var paddle_offset_bounce_index = GameSetting.new("Paddle Offset Bounce Index", 1.0, -3.0, 3.0)

static var all_settings = [
	init_ball_speed,
	max_ball_speed,
	min_ball_speed,
	ball_bounce_index,
	init_paddle_speed,
	paddle_bounce_index,
	paddle_offset_bounce_index,
]

static var settings_tree = [
	left_player_name,
	right_player_name,
	{"name": "Ball", "val": [init_ball_speed, max_ball_speed, min_ball_speed, ball_bounce_index]},
	{"name": "Paddle", "val": [
		{"name": "Speed", "val": [init_paddle_speed]},
		{"name": "Bounce", "val": [paddle_bounce_index, paddle_offset_bounce_index]},
	]}
]

