class_name NewGameForm
extends VBoxContainer

signal new_game_clicked()

@onready var PointsLabel = $PointsHBox/PointsLabel

var points: int = 11

func plus_points():
	points += 1
	PointsLabel.text = str(points)

func minus_points():
	if points <= 1:
		return

	points -= 1
	PointsLabel.text = str(points)
	



func _on_start_button_pressed():
	Global.points_to_win = points
	get_tree().change_scene_to_file("res://game/game.tscn")


func _on_minut_button_pressed():
	minus_points()


func _on_plus_button_pressed():
	plus_points()
