extends Node2D

class Line:
	var start
	var end
	var color
	var time

	func _init(start, end, color, time):
		self.start = start
		self.end = end
		self.color = color
		self.time = time

var lines = []
var removed_line = false

func _process (delta):
	for i in range(len(lines)):
		lines[i].time -= delta

	if (len (lines) > 0 || removed_line):
		update()
		removed_line = false

func _draw ():
	var camera = get_viewport ().get_camera ()
	for i in range (len (lines)):
		var screen_point_start = camera.unproject_position (lines[i].start)
		var screen_point_end = camera.unproject_position (lines[i].end)
		
		if (camera.is_position_behind (lines[i].start) || camera.is_position_behind (lines[i].end)):
			continue

		draw_line3d(screen_point_start, screen_point_end, lines[i].color)
	
	var i = lines.size () - 1
	while (i >= 0):
		if (lines[i].time < 0.0):
			lines.remove (i)
			removed_line = true
		i -= 1

func draw_line3d (start, end, color, time = 0.0):
	lines.append (Line.new (start, end, color, time))
