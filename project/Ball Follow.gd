extends Camera

var offset =  Vector3(1, 1, 1)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var blue_ball
# Called when the node enters the scene tree for the first time.
func _ready():
	blue_ball = get_parent()

func _process(delta):
	look_at_from_position(blue_ball.translation + offset, blue_ball.translation, Vector3(0, 1, 0))
