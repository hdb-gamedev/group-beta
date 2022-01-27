extends Spatial

var maxdistance

func _ready():
	maxdistance = 1.0 - $CSGMesh.get_material().get_shader_param("outerthickness") - $CSGMesh.get_material().get_shader_param("innerradius")

func _process(delta):
	
	var mouse_position = get_viewport().get_mouse_position()
	var camera = get_viewport().get_camera()
	var ray_origin = camera.project_ray_origin(mouse_position)
	var ray_end = ray_origin + camera.project_ray_normal(mouse_position) * 2000
	var plane = Plane(0, 1, 0, 0) # 0x + 1y + 0z = 0
	var intersection = plane.intersects_segment(ray_origin, ray_end)
	
	
	if intersection:
		$CSGSphere.global_transform.origin = intersection
		var v = Vector2(intersection.x, intersection.z)
		var distance = min(v.length(), maxdistance)
		var v2 = v.normalized() * distance
			
		$CSGMesh.get_material().set_shader_param("position", v2)
