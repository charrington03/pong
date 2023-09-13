class_name Goal
extends Area2D

signal ball_entered

@export var is_left: bool



func _on_body_entered(body):
	if body is Ball:
		ball_entered.emit()
