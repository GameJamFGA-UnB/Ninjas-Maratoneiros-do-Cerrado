extends Label

var time_elapsed := 30.0

func _process(delta: float) -> void:
	time_elapsed -= delta
	var tempo = int(time_elapsed)
	set_text(String(tempo))
