class_name GameSettingsTree
extends Tree

var root: TreeItem

var settings_map = {}

func _init():
	set_column_custom_minimum_width(0, 150)
	set_column_custom_minimum_width(1, 100)
	
	root = create_item()
	for item in GameSettings.settings_tree:
		add_item(root, item)
	
	reset()


func add_item(parent: TreeItem, item):
	if item is GameSetting:
		add_setting(parent, item)
		return
	
	var tree_item = create_item(parent)
	tree_item.set_text(0, item.get("name"))
	tree_item.set_selectable(0, false)
	tree_item.set_selectable(1, false)
	
	for child in item.get("val"):
		add_item(tree_item, child)


func add_setting(parent: TreeItem, setting: GameSetting):
	var tree_item = create_item(parent)
	tree_item.set_text(0, setting.name)
	tree_item.set_selectable(0, false)	
	tree_item.set_editable(1, true)
	
	# TODO: add the actual setting input and whatnot
	if setting.min_val and setting.max_val and (setting.val is float or setting.val is int):
		range_setup(tree_item, setting)
	elif setting.val is String:
		string_setup(tree_item, setting)
	elif setting.val is bool:
		check_setup(tree_item, setting)
	
	


func range_setup(tree_item: TreeItem, setting: GameSetting):
	assert(setting.min_val != null, "ERROR")
	assert(setting.max_val != null, "ERROR")
	assert(setting.val is int or setting.val is float, "ERROR")
	
	tree_item.set_cell_mode(1, TreeItem.CELL_MODE_RANGE)
	tree_item.set_range(1, float(setting.default_val))
	
	var range_step = 1.0 if setting.val is int else 0.1
	tree_item.set_range_config(1, float(setting.min_val), float(setting.max_val), range_step)
	
	settings_map[setting] = {
		"apply": func(): setting.set_val(tree_item.get_range(1) if setting.default_val is float else int(tree_item.get_range(1))),
		"reset": func(): tree_item.set_range(1, setting.default_val)
	}


func string_setup(tree_item: TreeItem, setting: GameSetting):
	assert(setting.val is String, "ERROR")
	
	tree_item.set_cell_mode(1, TreeItem.CELL_MODE_STRING)	
	tree_item.set_text(1, setting.default_val)
	
	settings_map[setting] = {
		"apply": func(): setting.set_val(tree_item.get_text(1)),
		"reset": func(): tree_item.set_text(1, setting.default_val)
	}


func check_setup(tree_item: TreeItem, setting: GameSetting):
	assert(setting.val is bool, "ERROR")
	
	tree_item.set_cell_mode(1, TreeItem.CELL_MODE_CHECK)
	tree_item.set_checked(1, setting.default_val)
	
	settings_map[setting] = {
		"apply": func(): setting.set_val(tree_item.is_checked(1)),
		"reset": func(): tree_item.set_checked(1, setting.default_val)
	}


func apply_settings():
	for setting in settings_map.keys():
		settings_map[setting]["apply"].call()


func reset():
	for setting in settings_map.keys():
		settings_map[setting]["reset"].call()
