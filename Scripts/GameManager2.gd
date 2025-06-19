extends Node
var deck = [
	{"id": 1, "name": "As de clubs", "texture": "res://assets/Cards (large)/card_clubs_A.png"},
	{"id": 2, "name": "2 de clubs", "texture": "res://assets/Cards (large)/card_clubs_02.png"},
	{"id": 3, "name": "3 de clubs", "texture": "res://assets/Cards (large)/card_clubs_03.png"},
	{"id": 4, "name": "4 de clubs", "texture": "res://assets/Cards (large)/card_clubs_04.png"},
	{"id": 5, "name": "5 de clubs", "texture": "res://assets/Cards (large)/card_clubs_05.png"},
	{"id": 6, "name": "6 de clubs", "texture": "res://assets/Cards (large)/card_clubs_06.png"},
	{"id": 7, "name": "7 de clubs", "texture": "res://assets/Cards (large)/card_clubs_07.png"},
	{"id": 8, "name": "8 de clubs", "texture": "res://assets/Cards (large)/card_clubs_08.png"},
	{"id": 9, "name": "9 de clubs", "texture": "res://assets/Cards (large)/card_clubs_09.png"},
	{"id": 10, "name": "10 de clubs", "texture": "res://assets/Cards (large)/card_clubs_10.png"},
	{"id": 11, "name": "J de clubs", "texture": "res://assets/Cards (large)/card_clubs_J.png"},
	{"id": 12, "name": "Q de clubs", "texture": "res://assets/Cards (large)/card_clubs_Q.png"},
	{"id": 13, "name": "K de clubs", "texture": "res://assets/Cards (large)/card_clubs_K.png"},
	{"id": 14, "name": "As de diamons", "texture": "res://assets/Cards (large)/card_diamonds_A.png"},
	{"id": 15, "name": "2 de diamons", "texture": "res://assets/Cards (large)/card_diamonds_02.png"},
	{"id": 16, "name": "3 de diamons", "texture": "res://assets/Cards (large)/card_diamonds_03.png"},
	{"id": 17, "name": "4 de diamons", "texture": "res://assets/Cards (large)/card_diamonds_04.png"},
	{"id": 18, "name": "5 de diamons", "texture": "res://assets/Cards (large)/card_diamonds_05.png"},
	{"id": 19, "name": "6 de diamons", "texture": "res://assets/Cards (large)/card_diamonds_06.png"},
	{"id": 20, "name": "7 de diamons", "texture": "res://assets/Cards (large)/card_diamonds_07.png"},
	{"id": 21, "name": "8 de diamons", "texture": "res://assets/Cards (large)/card_diamonds_08.png"},
	{"id": 22, "name": "9 de diamons", "texture": "res://assets/Cards (large)/card_diamonds_09.png"},
	{"id": 23, "name": "10 de diamons", "texture": "res://assets/Cards (large)/card_diamonds_10.png"},
	{"id": 24, "name": "J de diamons", "texture": "res://assets/Cards (large)/card_diamonds_J.png"},
	{"id": 25, "name": "Q de diamons", "texture": "res://assets/Cards (large)/card_diamonds_Q.png"},
	{"id": 26, "name": "K de diamons", "texture": "res://assets/Cards (large)/card_diamonds_K.png"},
	{"id": 27, "name": "As de hearts", "texture": "res://assets/Cards (large)/card_hearts_A.png"},
	{"id": 28, "name": "2 de hearts", "texture": "res://assets/Cards (large)/card_hearts_02.png"},
	{"id": 29, "name": "3 de hearts", "texture": "res://assets/Cards (large)/card_hearts_03.png"},
	{"id": 30, "name": "4 de hearts", "texture": "res://assets/Cards (large)/card_hearts_04.png"},
	{"id": 31, "name": "5 de hearts", "texture": "res://assets/Cards (large)/card_hearts_05.png"},
	{"id": 32, "name": "6 de hearts", "texture": "res://assets/Cards (large)/card_hearts_06.png"},
	{"id": 33, "name": "7 de hearts", "texture": "res://assets/Cards (large)/card_hearts_07.png"},
	{"id": 34, "name": "8 de hearts", "texture": "res://assets/Cards (large)/card_hearts_08.png"},
	{"id": 35, "name": "9 de hearts", "texture": "res://assets/Cards (large)/card_hearts_09.png"},
	{"id": 36, "name": "10 de hearts", "texture": "res://assets/Cards (large)/card_hearts_10.png"},
	{"id": 37, "name": "J de hearts", "texture": "res://assets/Cards (large)/card_hearts_J.png"},
	{"id": 38, "name": "Q de hearts", "texture": "res://assets/Cards (large)/card_hearts_Q.png"},
	{"id": 39, "name": "K de hearts", "texture": "res://assets/Cards (large)/card_hearts_K.png"},
	{"id": 40, "name": "As de spades", "texture": "res://assets/Cards (large)/card_spades_A.png"},
	{"id": 41, "name": "2 de spades", "texture": "res://assets/Cards (large)/card_spades_02.png"},
	{"id": 42, "name": "3 de spades", "texture": "res://assets/Cards (large)/card_spades_03.png"},
	{"id": 43, "name": "4 de spades", "texture": "res://assets/Cards (large)/card_spades_04.png"},
	{"id": 44, "name": "5 de spades", "texture": "res://assets/Cards (large)/card_spades_05.png"},
	{"id": 45, "name": "6 de spades", "texture": "res://assets/Cards (large)/card_spades_06.png"},
	{"id": 46, "name": "7 de spades", "texture": "res://assets/Cards (large)/card_spades_07.png"},
	{"id": 47, "name": "8 de spades", "texture": "res://assets/Cards (large)/card_spades_08.png"},
	{"id": 48, "name": "9 de spades", "texture": "res://assets/Cards (large)/card_spades_09.png"},
	{"id": 49, "name": "10 de spades", "texture": "res://assets/Cards (large)/card_spades_10.png"},
	{"id": 50, "name": "J de spades", "texture": "res://assets/Cards (large)/card_spades_J.png"},
	{"id": 51, "name": "Q de spades", "texture": "res://assets/Cards (large)/card_spades_Q.png"},
	{"id": 52, "name": "K de spades", "texture": "res://assets/Cards (large)/card_spades_K.png"},
]

var descarte_dict = []

#var player1_cartas_abajo = []
#var player1_cartas_arriba = []
#var player1_mano = []

var jugadores = []
var turno_actual = 0  # 0 a 3 para 4 jugadores
var selected_card = null

func start_game():
	# Posicionar elementos UI en local (todos pueden hacerlo)
	$Descarte.position = Vector2(640, 360)
	$Deck.position = Vector2(420, 300)
	$TomarCartas.position = Vector2(350, 500)
	$PasarTurno.position = Vector2(850, 500)
	
	if is_multiplayer_authority():
		# Solo el servidor hace la configuración y lógica del juego
		crear_jugadores()
		repartir_cartas()
		
		# Enviar la lista completa de jugadores con sus datos a todos
		rpc("sincronizar_jugadores", jugadores)
		
		# Enviar info para mostrar cartas en pantalla de forma sincronizada
		rpc("cartas_pantalla_sincronizada", jugadores)
		
		# Poner la primera carta en el descarte (solo servidor la instancia)
		var carta_inicio = deck.pop_front()
		descarte_dict.append(carta_inicio)
		
		# Notificar a clientes para que actualicen visualmente el descarte
		rpc("crear_carta_en_descarte", carta_inicio["id"], carta_inicio["name"], carta_inicio["texture"])
		
		# Inicializar turno y notificar
		turno_actual = 0
		actualizar_turno(turno_actual)
		rpc("actualizar_turno", turno_actual)

	else:
		# Clientes esperan sincronización (reciben rpc sincronizar_jugadores, cartas, descarte, turno)
		pass

func crear_jugadores():
	jugadores.clear()

	var peers_validos := []

	# Incluir el peer local si NO es un servidor dedicado
	if not OS.has_feature("server"):
		peers_validos.append(multiplayer.get_unique_id())

	# Agregar los demás peers conectados
	for peer_id in multiplayer.get_peers():
		peers_validos.append(peer_id)

	# Ahora sí, usar un índice válido para los Player1, Player2, etc.
	var i = 1
	for peer_id in peers_validos:
		var nodo_path = "Player" + str(i)
		var jugador = {
			"peer_id": peer_id,
			"mano": [],
			"cartas_abajo": [],
			"cartas_arriba": [],
			"nodo_path": nodo_path
		}
		jugadores.append(jugador)
		i += 1




func repartir_cartas():
	deck.shuffle()
	# Limpiar cartas anteriores para cada jugador
	for jugador in jugadores:
		jugador["cartas_abajo"].clear()
		jugador["cartas_arriba"].clear()
		jugador["mano"].clear()
	
	# Repartir cartas
	for j in range(jugadores.size()):  # jugadores
		for i in range(3):
			jugadores[j]["cartas_abajo"].append(deck.pop_front())
			jugadores[j]["cartas_arriba"].append(deck.pop_front())
			jugadores[j]["mano"].append(deck.pop_front())
	
	rpc("cartas_pantalla_sincronizada", jugadores)

func limpiar_nodo(nodo):
	for hijo in nodo.get_children():
		hijo.queue_free()
		
func cartas_pantalla(jugadores):
	var mi_peer_id = multiplayer.get_unique_id()
	var local_player = jugadores.filter(func(j): return j["peer_id"] == mi_peer_id)
	if local_player.size() == 0:
		print("Error: No se encontró al jugador local en la lista de jugadores.")
		return

	var indice_local = jugadores.find(local_player[0])

	# Crear una lista ordenada desde el punto de vista local
	var jugadores_ordenados = []
	for i in range(jugadores.size()):
		var index = (i + indice_local) % jugadores.size()
		jugadores_ordenados.append(jugadores[index])

	# Reorganizar las cartas solo para la vista local
	for i in range(jugadores_ordenados.size()):
		var jugador = jugadores_ordenados[i]

		# Ignorar jugadores sin nodo_path o si no existe el nodo
		if not jugador.has("nodo_path"):
			continue

		var base_path = jugador["nodo_path"]
		var mano_node = get_node_or_null(base_path + "/Mano")
		var abajo_node = get_node_or_null(base_path + "/Cartas_abajo")
		var arriba_node = get_node_or_null(base_path + "/Cartas_arriba")

		if mano_node == null or abajo_node == null or arriba_node == null:
			print("No se encontraron nodos de cartas para el jugador: ", jugador)
			continue

		# Limpiar nodos para evitar duplicados
		limpiar_nodo(mano_node)
		limpiar_nodo(abajo_node)
		limpiar_nodo(arriba_node)

		match i:
			0:
				mano_node.position = Vector2(500, 700)
				abajo_node.position = Vector2(530, 520)
				arriba_node.position = Vector2(500, 530)
				mano_node.rotation_degrees = 0
				abajo_node.rotation_degrees = 0
				arriba_node.rotation_degrees = 0
			1:
				mano_node.position = Vector2(20, 360)
				abajo_node.position = Vector2(200, 360)
				arriba_node.position = Vector2(200, 320)
				mano_node.rotation_degrees = 90
				abajo_node.rotation_degrees = 90
				arriba_node.rotation_degrees = 90
			2:
				mano_node.position = Vector2(700, 20)
				abajo_node.position = Vector2(720, 200)
				arriba_node.position = Vector2(730, 200)
				mano_node.rotation_degrees = -180
				abajo_node.rotation_degrees = -180
				arriba_node.rotation_degrees = -180
			3:
				mano_node.position = Vector2(1260, 360)
				abajo_node.position = Vector2(1080, 360)
				arriba_node.position = Vector2(1080, 400)
				mano_node.rotation_degrees = -90
				abajo_node.rotation_degrees = -90
				arriba_node.rotation_degrees = -90

		# Agregar cartas a la mano
		for carta_data in jugador["mano"]:
			var card_instance = preload("res://Items/Cards/Scene/Card.tscn").instantiate()
			card_instance.card_id = carta_data["id"]
			card_instance.card_name = carta_data["name"]
			card_instance.front_texture = load(carta_data["texture"])
			card_instance.is_face_up = (jugador["peer_id"] == multiplayer.get_unique_id())
  # Solo el jugador 0 ve sus cartas boca arriba
			mano_node.add_child(card_instance)
			card_instance.position = Vector2(jugador["mano"].find(carta_data) * 80, 0)
			card_instance.colision.disabled = (i != turno_actual)
			card_instance.owner_id = jugador["peer_id"]

		# Cartas abajo (boca abajo)
		for carta_data in jugador["cartas_abajo"]:
			var card_instance = preload("res://Items/Cards/Scene/Card.tscn").instantiate()
			card_instance.card_id = carta_data["id"]
			card_instance.card_name = carta_data["name"]
			card_instance.front_texture = load(carta_data["texture"])
			card_instance.is_face_up = false
			abajo_node.add_child(card_instance)
			card_instance.position = Vector2(jugador["cartas_abajo"].find(carta_data) * 80, 0)
			card_instance.colision.disabled = true
			card_instance.owner_id = jugador["peer_id"]
			

		# Cartas arriba (boca arriba)
		for carta_data in jugador["cartas_arriba"]:
			var card_instance = preload("res://Items/Cards/Scene/Card.tscn").instantiate()
			card_instance.card_id = carta_data["id"]
			card_instance.card_name = carta_data["name"]
			card_instance.front_texture = load(carta_data["texture"])
			card_instance.is_face_up = true
			arriba_node.add_child(card_instance)
			card_instance.position = Vector2(jugador["cartas_arriba"].find(carta_data) * 80, 10)
			card_instance.colision.disabled = true
			card_instance.owner_id = jugador["peer_id"]
			

# Función que llama el jugador local cuando quiere jugar una carta
#func peticion(card):
	##print("Se quiere jugar una carta")
	#if multiplayer.is_server():
		#print("Se quiere jugar una carta")
		## No eres host/servidor, manda la petición para que el host valide
		##rpc_id(1, "request_play_card", card.card_id)
	##else:
		## Si eres el host, directamente validas y juegas
		##play_card(card)

func _on_pasar_turno_pressed():
	var server_id = multiplayer.get_unique_id() if multiplayer.is_server() else 1
	if multiplayer.is_server():
		avanzar_turno()
	else:
		# Cliente solicita al servidor que avance el turno
		rpc_id(server_id, "avanzar_turno")  # asumiendo que el server tiene id 1

func _on_tomar_cartas_pressed() -> void:
	#rpcid(1, "solicitar_tomar_cartas", turno_actual)  # 1 es el peer_id del servidor
	rpc("solicitar_tomar_cartas", turno_actual)  # 1 es el peer_id del servidor



@rpc("any_peer", "call_local")
func crear_carta_en_descarte(card_id, card_name, texture_path):
	var card_instance = preload("res://Items/Cards/Scene/Card.tscn").instantiate()
	card_instance.card_id = card_id
	card_instance.card_name = card_name
	card_instance.front_texture = load(texture_path)
	card_instance.is_face_up = true
	card_instance.is_in_hand = false
	card_instance.owner_id = 0

	var offset = Vector2(randf_range(-5, 5), randf_range(-5, 5))
	card_instance.position = Vector2.ZERO + offset
	card_instance.rotation_degrees = randf_range(-10, 10)

	$Descarte.add_child(card_instance)
	card_instance.colision.disabled = true
	card_instance.set_process_input(false)

@rpc("any_peer", "call_local")
func solicitar_tomar_cartas(jugador_id: int):
	if multiplayer.is_server():
		tomar_cartas_turno(jugador_id)


@rpc("authority")
func tomar_cartas_turno(jugador_id: int):
	print("Llamando entregar_carta_pantalla_rpc desde peer: ", multiplayer.get_unique_id())
	var jugador = jugadores[jugador_id]
	var mano = jugador["mano"]
	var descarte_nodo = $Descarte

	var cartas_a_eliminar = []

	for nodo_card in descarte_nodo.get_children():
		for i in range(descarte_dict.size()):
			var card_data = descarte_dict[i]
			if nodo_card.card_id == card_data["id"]:
				print("TOMANDO LAS CARTAS DEL DESCARTE")
				#rpc("entregar_carta_pantalla_rpc", nueva_carta["id"], nueva_carta["name"], nueva_carta["texture"], turno_actual)
				rpc("entregar_carta_pantalla_rpc", card_data["id"], card_data["name"], card_data["texture"], turno_actual)
				#entregar_carta_pantalla(card_data, turno_actual)
				mano.append(card_data)
				cartas_a_eliminar.append(nodo_card)

	for carta_nodo in cartas_a_eliminar:
		carta_nodo.queue_free()

	descarte_dict.clear()


@rpc("any_peer")  # cualquiera (y el servidor mismo) recibirá esta llamada
func sincronizar_jugadores(lista_recibida: Array):
	jugadores.clear()
	for j in lista_recibida:
		var jugador = {
			"peer_id":j["peer_id"],
			"mano": j["mano"],
			"cartas_abajo": j["cartas_abajo"],
			"cartas_arriba": j["cartas_arriba"],
			"nodo_path": get_node(j["nodo_path"])
		}
		jugadores.append(jugador)
	print("Peer %s sincronizó jugadores: %s" % [multiplayer.get_unique_id(), jugadores])

@rpc("authority", "call_local")  # Esto lo ejecutan todos los peers, pero la orden la da el server
func cartas_pantalla_sincronizada(jugadores_rpc):
	jugadores = jugadores_rpc  # Guardar copia local
	cartas_pantalla(jugadores)

# Esta función solo la ejecuta el servidor para avanzar el turno
@rpc("any_peer")
func avanzar_turno():
	if not multiplayer.is_server():
		return # Solo servidor debe procesar esto
	turno_actual = (turno_actual + 1) % jugadores.size()
	print("Servidor: turno actual -> ", turno_actual + 1)

	# Actualiza localmente el servidor
	actualizar_turno(turno_actual)

	# Enviar a clientes el nuevo turno
	rpc("actualizar_turno", turno_actual)

@rpc("any_peer")
func actualizar_turno(nuevo_turno):
	turno_actual = nuevo_turno
	$TurnoLabel.text = "Turno del jugador " + str(turno_actual + 1)
	#actualizar_colisiones_cartas_fuera_de_mano()
	
	# Obtener el peer_id del jugador actual
	var jugador_turno_peer_id = jugadores[turno_actual]["peer_id"]
	var mi_peer_id = multiplayer.get_unique_id()

	# Habilitar el botón solo si este jugador es el local y es su turno
	$PasarTurno.disabled = (mi_peer_id != jugador_turno_peer_id)
	$TomarCartas.disabled = (mi_peer_id != jugador_turno_peer_id)
	# Da permisos de interactuar con el Deck pero solo funciona con el jugador en Turno
	# NECESITO VALIDAR SI EXISTE EL DECK PORQUE SI NO CRASHEA PERO UNA VEZ QUE SE HAYAN ACABADO LAS CARTAS
	$Deck.set_multiplayer_authority(mi_peer_id)
	actualizar_colisiones_cartas_fuera_de_mano()

@rpc("any_peer", "call_local")
func press_deck(peer_id):
	#var peer_id = multiplayer.get_remote_sender_id()
	if peer_id != jugadores[turno_actual]["peer_id"]:
		print("⛔ Jugador", peer_id, "intentó tomar carta fuera de turno")
		return
		
	var jugador = jugadores[turno_actual]

	if deck.size() > 0 and jugador["mano"].size() < 3:
		var nueva_carta = deck.pop_front()
		jugador["mano"].append(nueva_carta)
		
		# Notificar a todos para mostrar la carta en pantalla
		rpc("entregar_carta_pantalla_rpc", nueva_carta["id"], nueva_carta["name"], nueva_carta["texture"], turno_actual)
		
		if deck.size() == 0:
			rpc("eliminar_deck")  # Lo ocultamos en todos
	else:
		print("Tienes 3 cartas en tu mano")

@rpc("any_peer")
func eliminar_deck():
	if $Deck:
		$Deck.queue_free()

#func entregar_carta_pantalla(card_data, turno_actual):
	#var jugador = jugadores[turno_actual]
	#var mano_node = get_node(jugador["nodo_path"] + "/Mano")
#
	#var card_instance = preload("res://Items/Cards/Scene/Card.tscn").instantiate()
	#card_instance.card_id = card_data["id"]
	#card_instance.card_name = card_data["name"]
	#card_instance.front_texture = load(card_data["texture"])
	#card_instance.is_face_up = (jugador["peer_id"] == multiplayer.get_unique_id())
	#card_instance.is_in_hand = true
	#card_instance.owner_id = jugador["peer_id"]
#
	#mano_node.add_child(card_instance)
	#
	## Separación horizontal entre cartas
	#var separation = 80
	#var total = mano_node.get_child_count()
	#var offset = -((total - 1) * separation) / 2.0  # para centrar
	#
	#var tween = create_tween()
	#
	#for i in range(total):
		#var child_card = mano_node.get_child(i)
		#var new_position = Vector2(offset + i * separation, 0)
		#
		#tween.tween_property(child_card, "position", new_position, 0.3).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		#
		#if child_card == card_instance:
			#tween.tween_property(child_card, "scale", Vector2(1.1, 1.1), 0.1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
			#tween.tween_property(child_card, "scale", Vector2(1, 1), 0.1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	##actualizar_colisiones_cartas_fuera_de_mano()

# Función RPC que recibe solo datos serializables y llama a la función local
@rpc("any_peer", "call_local")
func entregar_carta_pantalla_rpc(card_id: int, card_name: String, card_texture_path: String, turno_actual: int):
	# Buscar si ya existe una instancia de la carta (por ejemplo, en el descarte)
	print("Llamando entregar_carta_pantalla_rpc desde peer: ", multiplayer.get_unique_id())

	var descarte_node = $Descarte
	for card_node in descarte_node.get_children():
		if card_node.card_id == card_id:
			card_node.queue_free()
			break

	var jugador = jugadores[turno_actual]
	var mano_node = get_node(jugador["nodo_path"] + "/Mano")

	var card_instance = preload("res://Items/Cards/Scene/Card.tscn").instantiate()
	card_instance.card_id = card_id
	card_instance.card_name = card_name
	card_instance.front_texture = load(card_texture_path)
	card_instance.is_face_up = (jugador["peer_id"] == multiplayer.get_unique_id())
	card_instance.is_in_hand = true
	card_instance.owner_id = jugador["peer_id"]

	mano_node.add_child(card_instance)
	
	# Separación horizontal entre cartas
	var separation = 80
	var total = mano_node.get_child_count()
	var offset = -((total - 1) * separation) / 2.0  # para centrar
	
	var tween = create_tween()
	
	for i in range(total):
		var child_card = mano_node.get_child(i)
		var new_position = Vector2(offset + i * separation, 0)
		
		tween.tween_property(child_card, "position", new_position, 0.3).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		
		if child_card == card_instance:
			tween.tween_property(child_card, "scale", Vector2(1.1, 1.1), 0.1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
			tween.tween_property(child_card, "scale", Vector2(1, 1), 0.1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)


func hay_cartas_en_mano(jugador) -> bool:
	var mano_node = get_node(jugador["nodo_path"] + "/Mano")
	if mano_node.get_child_count() != 0:
			return true
	return false

func hay_cartas_arriba(jugador) -> bool:
	var arriba_node = get_node(jugador["nodo_path"] + "/Cartas_arriba")
	if arriba_node.get_child_count() != 0:
			return true
	return false

func actualizar_colisiones_cartas_fuera_de_mano():
	# Desactivar colisiones en todas las cartas de todos los jugadores
	for jugador in jugadores:
		var mano_node = get_node_or_null(jugador["nodo_path"] + "/Mano")
		var abajo_node = get_node_or_null(jugador["nodo_path"] + "/Cartas_abajo")
		var arriba_node = get_node_or_null(jugador["nodo_path"] + "/Cartas_arriba")

		if mano_node:
			for carta in mano_node.get_children():
				carta.colision.disabled = true
		else:
			print("❌ No se encontró:", jugador["nodo_path"] + "/Mano")

		if arriba_node:
			for carta in arriba_node.get_children():
				carta.colision.disabled = true
		else:
			print("❌ No se encontró:", jugador["nodo_path"] + "/Cartas_arriba")

		if abajo_node:
			for carta in abajo_node.get_children():
				carta.colision.disabled = true
		else:
			print("❌ No se encontró:", jugador["nodo_path"] + "/Cartas_abajo")


	# Activar colisiones solo para el jugador actual
	var jugador_actual = jugadores[turno_actual]
	var mano_actual = get_node(jugador_actual["nodo_path"] + "/Mano")
	var abajo_actual = get_node(jugador_actual["nodo_path"] + "/Cartas_abajo")
	var arriba_actual = get_node(jugador_actual["nodo_path"] + "/Cartas_arriba")

	if hay_cartas_en_mano(jugador_actual):
		for carta in mano_actual.get_children():
			carta.colision.disabled = false
	elif hay_cartas_arriba(jugador_actual):
		for carta in arriba_actual.get_children():
			carta.colision.disabled = false
	else:
		for carta in abajo_actual.get_children():
			carta.colision.disabled = false

@rpc("any_peer","call_local")
func carta_abajo_seleccionada(card):
	var jugador = jugadores[turno_actual]
	var cartas_abajo = jugador["cartas_abajo"]
	var mano = jugador["mano"]
	var card_id = card.card_id
	for i in range(cartas_abajo.size()):
		var card_data = cartas_abajo[i]
		if card_id == card_data["id"]:
			#print("Descartando: ", card_data)
			mano.append(card_data) # Se agrega al diccionario de descartes
			cartas_abajo.erase(card_data) # Se elimina la carta de la mano en el diccionario
			rpc("entregar_carta_pantalla_rpc", card_data["id"], card_data["name"], card_data["texture"], turno_actual)
			card.queue_free()
			break

func on_card_selected(card):
	# Solo permitir seleccionar cartas propias
	if card.owner_id != multiplayer.get_unique_id():
		return  # Ignora la selección si no es tu carta
	var hay_mano = hay_cartas_en_mano(jugadores[turno_actual])
	var hay_arriba = hay_cartas_arriba(jugadores[turno_actual])
	
	if hay_mano:
		# Hay una carta en la mano → lógica normal
		if selected_card == null:
			card.select_card()
			selected_card = card

		elif selected_card == card:
			play_card(card)
			selected_card = null

		else:
			selected_card.select_card()
			card.select_card()
			selected_card = card
	
	elif not hay_mano and hay_arriba:
		if selected_card == null:
			card.select_card()
			selected_card = card

		elif selected_card == card:
			play_card(card)
			selected_card = null

		else:
			selected_card.select_card()
			card.select_card()
			selected_card = card
			
	elif not hay_mano and not hay_arriba:
		if selected_card == null:
			card.select_card()
			selected_card = card

		elif selected_card == card:
			#play_card(card)
			carta_abajo_seleccionada(card)
			selected_card = null

		else:
			selected_card.select_card()
			card.select_card()
			selected_card = card

func descartar_dict(card_id: int):
	var jugador = jugadores[turno_actual]
	var mano = jugador["mano"]
	var arriba = jugador["cartas_arriba"]

	for i in range(mano.size()):
		if mano[i]["id"] == card_id:
			descarte_dict.append(mano[i])
			mano.remove_at(i)
			return

	for i in range(arriba.size()):
		if arriba[i]["id"] == card_id:
			descarte_dict.append(arriba[i])
			arriba.remove_at(i)
			return

func get_card_value(card):
	var name = card.card_name
	var parts = name.split(" ")
	var value_str = parts[0]
	
	match value_str:
		"As":
			return 14
		"J":
			return 11
		"Q":
			return 12
		"K":
			return 13
		_:
			return int(value_str)
			
@rpc("any_peer", "call_local")
func descartar_carta(card_id):
	var descarte_node = $Descarte
	var card = get_card_by_id(card_id)

	if card == null:
		push_error("No se encontró la carta con ID: " + str(card_id))
		return

	# Quitar de la mano visualmente
	card.get_parent().remove_child(card)

	# Añadirla al nodo Descarte
	descarte_node.add_child(card)

	# Asegurar que quede arriba visualmente
	descarte_node.move_child(card, descarte_node.get_child_count() - 1)
	
	card.is_face_up = true
	card.update_texture()
	
	# Reposicionarla con desplazamiento
	var offset = Vector2(randf_range(-5, 5), randf_range(-5, 5))
	card.position = Vector2.ZERO + offset

	# Rotación aleatoria entre -10° y +10°
	card.rotation_degrees = randf_range(-10, 10)

	# Marcar que ya no está en la mano
	card.is_in_hand = false

	# Bloquear interacción
	card.set_process_input(false)
	card.colision.disabled = true

	descartar_dict(card.card_id)

@rpc("any_peer", "call_local") # o simplemente @rpc si estás en Godot 4.x
func limpiar_descarte_para_todos():
	var descarte_nodo = $Descarte
	for child in descarte_nodo.get_children():
		child.queue_free()
	descarte_dict.clear()


func get_card_by_id(card_id: int) -> Node2D:
	for player in get_children():
		if player.name.begins_with("Player"):
			for area in ["Mano", "Cartas_arriba", "Cartas_abajo"]:
				var contenedor = player.get_node_or_null(area)
				if contenedor:
					for carta in contenedor.get_children():
						#print("Revisando carta con ID:", carta.card_id)
						if carta.card_id == card_id:
							return carta
	return null

	
	# Buscar también en el Descarte (por si ya fue jugada)
	for carta in $Descarte.get_children():
		if carta.card_id == card_id:
			return carta

	return null  # No se encontró

func play_card(card):
	var valor = get_card_value(card)
	var descarte_nodo = $Descarte
	var ultima_carta_descarte = null
	var valor_carta_descarte = 0
	
	if descarte_nodo.get_child_count() > 0:
		ultima_carta_descarte = descarte_nodo.get_child(descarte_nodo.get_child_count() - 1)
		valor_carta_descarte = get_card_value(ultima_carta_descarte)
		
	if ultima_carta_descarte:
		
		if valor == 10:
			# Agregar un temporizador
			rpc("descartar_carta", card.card_id)
			# Elimina todas las cartas hijas del nodo Descarte
			rpc("limpiar_descarte_para_todos")

			#print(descarte_dict)
		
		elif valor == 2:
			valor_carta_descarte = 0
			rpc("descartar_carta", card.card_id)
			# print("Se jugó un 2")
		
		elif valor >= valor_carta_descarte:
			rpc("descartar_carta", card.card_id)
			
		else:
			# Si no se puede jugar la carta esto hace que no se pueda lanzar y contrarestar la animacion
			selected_card = null
			card.select_card()
	else:
		# Si no hay carta en descarte, cualquier carta puede abrir juego
		rpc("descartar_carta", card.card_id)
		
	# Verificar si las últimas 4 cartas son del mismo valor
	if descarte_nodo.get_child_count() >= 4:
		var total_cartas = descarte_nodo.get_child_count()
		var ultimos_4_valores = []
		
		for i in range(4):
			var carta = descarte_nodo.get_child(total_cartas - 1 - i)
			ultimos_4_valores.append(get_card_value(carta))
		
		# Verificar si todos los valores son iguales
		var mismo_valor = ultimos_4_valores.all(func(v): return v == ultimos_4_valores[0])
		
		if mismo_valor:
			# Efecto de eliminación
			rpc("limpiar_descarte_para_todos")
			print("¡4 cartas iguales! Descarte eliminado.")
