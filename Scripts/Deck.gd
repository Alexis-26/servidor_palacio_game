extends Area2D

func _ready():
	print("Deck listo para clics")

#func _input_event(viewport, event, shape_idx):
	#if event is InputEventMouseButton and event.pressed:
		#print("Tomando una carta...")
		#get_tree().call_group("game_manager", "press_deck", self)

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if not is_multiplayer_authority():
			return  # Solo el jugador dueño puede intentar pedir carta

		print("Solicitando carta al servidor...")
		var game_manager = get_tree().get_root().get_node("Multijugador/GameManager")
		game_manager.rpc_id(1, "press_deck", multiplayer.get_unique_id())
