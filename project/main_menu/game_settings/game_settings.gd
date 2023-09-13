class_name GameSettings
extends Object

# Ball Settings
static var init_ball_speed = GameSetting.new("Initial Ball Speed", 300)
static var max_ball_speed = GameSetting.new("Max Ball Speed", 1000)
static var min_ball_speed = GameSetting.new("Min Ball Speed", 50)
static var ball_bounce_index = GameSetting.new("Ball Bounce Index", 1.0)

# Paddle Settings
static var init_paddle_speed = GameSetting.new("Paddle Speed", 600)
static var paddle_bounce_index = GameSetting.new("Paddle Bounce Index", 1.0)
static var paddle_offset_bounce_index = GameSetting.new("Paddle Offset Bounce Index", 1.0)

static var all_settings = [
	init_ball_speed,
	max_ball_speed,
	min_ball_speed,
	ball_bounce_index,
	init_paddle_speed,
	paddle_bounce_index,
	paddle_offset_bounce_index,
]

static var test_setting = GameSetting.new("Is a test?", true)

static var settings_tree = [
	{"name": "Root Leaf Test", "val": [test_setting]},
	{"name": "Ball", "val": [init_ball_speed, max_ball_speed, min_ball_speed, ball_bounce_index]},
	{"name": "Paddle", "val": [
		{"name": "Speed", "val": [init_paddle_speed]},
		{"name": "Bounce", "val": [paddle_bounce_index, paddle_offset_bounce_index]},
	]}
]

