class_name GameSetting
extends Object

var name: String
var val	

func _init(name, val):
	self.name = name
	self.val = val

func set_val(new_val) -> void:
	assert(typeof(new_val) == typeof(val), "ERROR: Using wrong type for a game setting")
	val = new_val

func val_type() -> int:
	return typeof(val)
