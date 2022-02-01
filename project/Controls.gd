extends Spatial

export(NodePath) var ball_path = null
var maxdistance
var ball
func _ready():
	maxdistance = 0.5 - $CSGMesh.get_material().get_shader_param("outerthickness") - $CSGMesh.get_material().get_shader_param("innerradius")
	ball = get_node(ball_path)

var direction = Vector2(0, 0)

func _process(delta):
	# TODO: make it not control when moving
	# TODO: ne jump pas
	global_transform.origin = ball.global_transform.origin
	if Input.is_action_pressed("ball_shoot"):
		$CSGMesh.get_material().set_shader_param("pressed", true)
		var mouse_position = get_viewport().get_mouse_position()
		var camera = get_viewport().get_camera()
		var ray_origin = camera.project_ray_origin(mouse_position)
		var ray_end = ray_origin + camera.project_ray_normal(mouse_position) * 2000
		var plane = Plane(0, 1, 0, global_transform.origin.y) # 0x + 1y + 0z = 0
		var intersection = plane.intersects_segment(ray_origin, ray_end)
		
		
		if intersection:
			var v = intersection - global_transform.origin
			var v2 = Vector2(v.x, v.z)
			var distance = min(v2.length(), maxdistance)
			var v3 = v2.normalized() * distance
			direction = -v3
			$CSGMesh.get_material().set_shader_param("position", v3)
	else:
		$CSGMesh.get_material().set_shader_param("pressed", false)
	if Input.is_action_just_released("ball_shoot"):
		ball.launch(direction)
