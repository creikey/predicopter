extends RigidBody

const torque = 8.0
const thrust = 3.0

var inputs = [
	0, # down
	0, # up
	0, # right
]

func _process(delta):
	# keyboard input
	inputs[0] = int(Input.is_action_pressed("down"))
	inputs[1] = int(Input.is_action_pressed("up"))
	inputs[2] = int(Input.is_action_pressed("right"))

func _integrate_forces(state: PhysicsDirectBodyState):
#	state.linear_velocity += -state.total_gravity*state.step
	if inputs[0] == 1:
		state.linear_velocity += Vector3(0, -thrust, 0)*state.step
	if inputs[1] == 1:
		state.linear_velocity += Vector3(0, thrust, 0)*state.step
	if inputs[2] == 1:
		state.angular_velocity += Vector3(0, -torque, 0)*state.step

	var forward = state.transform.basis.z
	forward.y = 0.0 # can't go up from forward!
	state.linear_velocity += forward*1.0*state.step # move forward always
	state.angular_velocity += Vector3(-rotation.x, 0, -rotation.z)*3.0*state.step

func _on_PhysicalHelicopter_body_entered(body):
	get_tree().reload_current_scene()
