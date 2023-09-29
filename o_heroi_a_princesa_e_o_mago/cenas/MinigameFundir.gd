extends Node2D

export(PackedScene) var espada
var rng = RandomNumberGenerator.new()
var espadas = []
var restantes

func _ready():
	$Progresso.text = "Restantes: " + str(restantes)
	restantes = $ProgressBar.max_value
	start_shining()

func start_shining():
	$EspadaCenario/AnimatedSprite.frame = 6
	$EspadaCenario/AnimatedSprite.playing = false
	
func remover_espada(idx):
	espadas.pop_at(idx).queue_free()

func _process(delta):
	
	if Input.is_action_just_pressed("ui_accept"):
		var tam = espadas.size()
		var acertou = false
		for i in range(tam-1, -1, -1):
			var e = espadas[i]
			var x = e.position.x
			if x > 100 and x < 170:
				remover_espada(i)
				acertou = true
				break
			if x < -100:
				remover_espada(i)
		if acertou:
			if restantes > 0:
				restantes -= 1
			else:
				yield(get_tree().create_timer(0.5), "timeout")
				get_tree().change_scene("res://scenes/victory_scene.tscn")
			$SwordHit.play(0.34)
			$EspadaCenario/AnimatedSprite.playing = true
			yield(get_tree().create_timer(0.2), "timeout")
			start_shining()
		else:
			if restantes < $ProgressBar.max_value:
				restantes += 1
			$SwordMiss.play(0.26)
			
		$Progresso.text = "Restantes: " + str(restantes)
		$ProgressBar.value = $ProgressBar.max_value-restantes


func _on_SpawnEspada_timeout():
	var nova_espada = espada.instance()
	#espadas.append(nova_espada)
	espadas.push_front(nova_espada)
	add_child(nova_espada)
	
	#$SpawnEspada.wait_time = rng.randi_range(10,20)/20
	$SpawnEspada.wait_time = 0.5 * rng.randi_range(1,3)
	$SpawnEspada.start()
