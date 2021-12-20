extends Spatial

export (NodePath) var path

func _process(delta):
	get_node(path).rotation.y += delta*15.0
