extends Tree

var root: TreeItem

func _init():
	root = create_item()
	for category in GameSettings.settings_tree:
		add_item(root, category)
		
func add_item(parent: TreeItem, category: Dictionary):
	var tree_item = create_item(parent)
	tree_item.set_text(0, category["name"])
	
	for child in category["val"]:
		if child.is_class("GameSetting"): # leaf
			add_setting(tree_item, child)
		elif child.is_class("Dictionary"):
			add_item(tree_item, child)


func add_setting(parent: TreeItem, setting: GameSetting):
	var tree_item = create_item(parent)
	tree_item.set_text(0, setting.name) 
