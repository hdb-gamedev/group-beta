extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Button_button_up():
	#TODO make it toggle cameras
	get_node("/root/Spatial/BlueBall/Ball Follow").clear_current()
	get_node("/root/Spatial/Camera").make_current()
