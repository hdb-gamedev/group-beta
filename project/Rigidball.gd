extends RigidBody

var force = Vector3(0, 0, 0)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	var space_state = get_world().direct_space_state
# Declare member variables here. Examples:
# var a = 2
# var b = "text"



func _on_Area_input_event(camera, event, input_position, normal, shape_idx):
	var direction = input_position - self.position;
