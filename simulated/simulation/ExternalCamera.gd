extends Camera

func _process(delta):
	look_at($"../Viewport/PhysicalHelicopter".global_transform.origin, Vector3(0, 1, 0))
