
extends Control

@onready var SettingsPanel = $SettingsPanel
@onready var PointsForm = $NewGameForm


func _on_start_button_pressed():
	SettingsPanel.apply_settings()
	PointsForm.apply_settings()
	
	get_tree().change_scene_to_file("res://game/game.tscn")
