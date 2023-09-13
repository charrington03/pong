class_name SettingsTree
extends Object

var name: String = ""
var data: GameSetting = null
var children: Array[SettingsTree] = []

func _init(name: String, data: GameSetting):
	self.name = name
	self.data = data

func is_leaf() -> bool:
	return !children.is_empty()

	
func add(name: String, data: GameSetting) -> SettingsTree:
	var new = SettingsTree.new(name, data)
	children.append(new)
	return new
