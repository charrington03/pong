class_name WinOverlay
extends Control

func _ready():
	$Label.text = "%s wins" % Global.winner_name


func _on_button_pressed():
	get_tree().change_scene_to_file("res://main_menu/main_menu.tscn")
	
