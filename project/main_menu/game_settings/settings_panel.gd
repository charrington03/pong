extends Control

var SettingsTreeScn = preload("res://main_menu/game_settings/tree_scene/game_settings_tree.tscn")

@onready var SettingsTree = $VBoxContainer/GameSettingsTree

func apply_settings():
	SettingsTree.apply_settings()

func _on_reset_button_pressed():
	SettingsTree.reset()
