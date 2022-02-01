extends RigidBody

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	#var space_state = get_world().direct_space_state
	pass
	
func launch(direction):

	var impulse = Vector3(direction.x, 0, direction.y) * 50.0
	apply_central_impulse(impulse)
	
