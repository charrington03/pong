class_name GameSetting
extends Object

var name: String
var val
var default_val

var min_val = null
var max_val = null


func _init(name, val, min_val = null, max_val = null):
	self.name = name
	self.val = val
	self.default_val = val
	
	if min_val and max_val:
		assert(typeof(min_val) == typeof(val), "ERROR: GameSetting's min_val type doesn't match")
		assert(typeof(max_val) == typeof(val), "ERROR: GameSetting's max_val type doesn't match")
		
		self.min_val = min_val
		self.max_val = max_val

func set_val(new_val) -> void:
	assert(typeof(new_val) == typeof(val), "ERROR: Using wrong type for a game setting")
	if min_val and max_val:
		assert(new_val >= min_val and new_val <= max_val, "ERROR: Setting GameSetting's value out of bounds")
	
	val = new_val


func val_type() -> int:
	return typeof(val)
	
func as_string():
	"Name: %s | Value: %s | Default Value: %s | Min Value: %s | Max Value: %s | Type: %s" % [
		name, val, default_val, min_val, max_val, typeof(val)
	]
