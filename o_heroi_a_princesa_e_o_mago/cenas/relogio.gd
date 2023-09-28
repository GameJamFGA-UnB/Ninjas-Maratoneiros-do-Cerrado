extends Timer

var timer = Timer.new()

export var example = Label.new

func _process(delta):
	var t = timer.time_left
