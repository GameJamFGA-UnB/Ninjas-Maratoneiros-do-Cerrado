extends Node

func _ready():
	reset_Timer()
	pass

var sec = 0
var minutes = 0
var dsec = 30
var dminutes = 1


func _on_relogio_timeout():
	if sec==0:
		if minutes>0:
			minutes-=1
			sec = 60
	sec-=1

	
	$Label.text = String(minutes) + ":" + String(sec)
	pass # Replace with function body.


func reset_Timer():
	sec = dsec 
	minutes = dminutes
