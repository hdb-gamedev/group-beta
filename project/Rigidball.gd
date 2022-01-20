extends RigidBody

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	#var space_state = get_world().direct_space_state
	pass

func _on_Area_input_event(camera, event, input_position, normal, shape_idx):
	var direction = input_position - self.translation
	direction.y = 0
	direction = direction.normalized()
	if event.is_action_released("ball_shoot"):
		#self.linear_velocity = direction * 200.0
		add_central_force(direction * 200.0)
