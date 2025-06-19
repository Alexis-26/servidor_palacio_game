extends Node2D

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
var jugadores = []
var turno_actual = 0  # 0 a 3 para 4 jugadores
#var selected_card = null
@onready var players_node = $"../Players"

# Nueva función para que el servidor añada jugadores
func add_player_from_server(peer_id: int):
	var player_node_name = "Player" + str(jugadores.size() + 1) # Player1, Player2...
	
	var jugador_ui_server_instance = preload("res://Scenes/ClientePrincipal.tscn").instantiate()
	jugador_ui_server_instance.name = player_node_name
	players_node.add_child(jugador_ui_server_instance)
	print("GameManager: Nodo visual '{jugador_ui_server_instance.name}' creado en el servidor para peer ID: {peer_id}")
	
	var new_player_data = {
		"peer_id": peer_id,
		"mano": [],
		"cartas_abajo": [],
		"cartas_arriba": [],
		"nodo": jugador_ui_server_instance # Referencia al nodo UI para el SERVER
	}
	jugadores.append(new_player_data)
	print("GameManager: Jugador con peer_id {peer_id} añadido a la lista. Total jugadores: {jugadores.size()}")
	
	# Puedes iniciar el juego aquí o en una función separada.
	if jugadores.size() >= 2: # Por ejemplo, si necesitas 2 clientes para empezar
		print("Número de jugadores suficiente, iniciando juego...")
		start_game()

# Nueva función para que el servidor elimine jugadores
func remove_player_from_server(peer_id: int):
	var player_to_remove_index = -1
	for i in range(jugadores.size()):
		if jugadores[i]["peer_id"] == peer_id:
			player_to_remove_index = i
			break
	
	if player_to_remove_index != -1:
		var removed_player_data = jugadores.pop_at(player_to_remove_index)
		# También libera el nodo visual si es necesario
		if is_instance_valid(removed_player_data["nodo"]):
			removed_player_data["nodo"].queue_free()
		print("GameManager: Jugador con peer_id eliminado. ", peer_id)
		print("GameManager: Total jugadores: ", jugadores.size())
		
	else:
		print("Advertencia: Jugador con peer_id no encontrado para eliminar. ", peer_id)

func start_game():
	if multiplayer.is_server():
		print("INICIANDO JUEGO")
		# `crear_jugadores` ya no necesita poblar la lista; solo valida y confirma.
		# La lista `jugadores` ya está llena por `add_player` del script del Servidor.
		confirmar_jugadores_y_preparar() 
		repartir_cartas()
		print("LISTO")
	
# Renombrada para mayor claridad. No "crea", sino que confirma la existencia.
func confirmar_jugadores_y_preparar():
	print("--- CONFIRMANDO JUGADORES (GameManager) ---")
	if jugadores.is_empty():
		print("¡Advertencia! No hay jugadores en la lista de GameManager para iniciar el juego.")
		return

	# Opcional: Reconfirmar que los nodos visuales están correctos, aunque add_player ya los asignó.
	for jugador_data in jugadores:
		if not is_instance_valid(jugador_data["nodo"]):
			print("ERROR: El nodo visual para peer_id ya no es válido. Abortando. ", jugador_data['peer_id'])
			# Aquí deberías manejar un error grave, quizás abortar el juego.
			return
		print("Jugador: ", jugador_data['peer_id'])
		print("Confirmado con nodo: ", jugador_data['nodo'].name)
	print("--- JUGADORES CONFIRMADOS (GameManager) ---")

func repartir_cartas():
	deck.shuffle()
	print("REVOLVIENDO CARTAS")
	
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
	
	print("REPARTIENDO CARTAS (Datos)")

	for jugador in jugadores:
		var peer_id = jugador["peer_id"]
		
		# --- FIN DEBUGGING ---
		Bridge.rpc_id(peer_id, "recibir_datos", jugadores)
		print("Enviando datos de cartas a peer_id: ", peer_id)

	print("LISTO")

# @rpc("any_peer") Esta función debe estar en el script del CLIENTE
# func recibir_datos(datos_player):
# 	# ... (lógica del cliente para actualizar su UI) ...
	#print(jugadores)

#func limpiar_nodo(nodo):
	#for hijo in nodo.get_children():
		#hijo.queue_free()

#@rpc("any_peer")
#func _repartir_cartas():
	##var mi_peer_id = multiplayer.get_unique_id()
	##var local_player = jugadores.filter(func(j): return j["peer_id"] == mi_peer_id)
	##if local_player.size() == 0:
		##print("Error: No se encontró al jugador local en la lista de jugadores.")
		##return
##
	##var indice_local = jugadores.find(local_player[0])
##
	### Crear una lista ordenada desde el punto de vista local
	##var jugadores_ordenados = []
	##for i in range(jugadores.size()):
		##var index = (i + indice_local) % jugadores.size()
		##jugadores_ordenados.append(jugadores[index])
##
	## Reorganizar las cartas solo para la vista local
	#for i in range(jugadores.size()):
		#var jugador = jugadores[i]
#
		## Ignorar jugadores sin nodo_path o si no existe el nodo
		#if not jugador.has("nodo_path"):
			#continue
		#var base_path = jugador["nodo_path"]
		#var mano_node = get_node(base_path + "/Mano")
		#var abajo_node = get_node(base_path + "/CartasAbajo")
		#var arriba_node = get_node(base_path + "/CartasArriba")
		#print(mano_node)
#
		#if mano_node == null or abajo_node == null or arriba_node == null:
			#print("No se encontraron nodos de cartas para el jugador: ", jugador)
			#continue
#
		## Limpiar nodos para evitar duplicados
		##limpiar_nodo(mano_node)
		##limpiar_nodo(abajo_node)
		##limpiar_nodo(arriba_node)
#
		## Agregar cartas a la mano
		#for carta_data in jugador["mano"]:
			#var card_instance = preload("res://Scenes/Card.tscn").instantiate()
			#card_instance.card_id = carta_data["id"]
			#card_instance.card_name = carta_data["name"]
			#card_instance.front_texture = load(carta_data["texture"])
			#card_instance.is_face_up = (jugador["peer_id"] == multiplayer.get_unique_id())
  ## Solo el jugador 0 ve sus cartas boca arriba
			#mano_node.add_child(card_instance)
			#card_instance.position = Vector2(jugador["mano"].find(carta_data) * 80, 0)
			#card_instance.colision.disabled = (i != turno_actual)
			#card_instance.owner_id = jugador["peer_id"]
#
		## Cartas abajo (boca abajo)
		#for carta_data in jugador["cartas_abajo"]:
			#var card_instance = preload("res://Scenes/Card.tscn").instantiate()
			#card_instance.card_id = carta_data["id"]
			#card_instance.card_name = carta_data["name"]
			#card_instance.front_texture = load(carta_data["texture"])
			#card_instance.is_face_up = false
			#abajo_node.add_child(card_instance)
			#card_instance.position = Vector2(jugador["cartas_abajo"].find(carta_data) * 80, 0)
			#card_instance.colision.disabled = true
			#card_instance.owner_id = jugador["peer_id"]
			#
#
		## Cartas arriba (boca arriba)
		#for carta_data in jugador["cartas_arriba"]:
			#var card_instance = preload("res://Scenes/Card.tscn").instantiate()
			#card_instance.card_id = carta_data["id"]
			#card_instance.card_name = carta_data["name"]
			#card_instance.front_texture = load(carta_data["texture"])
			#card_instance.is_face_up = true
			#arriba_node.add_child(card_instance)
			#card_instance.position = Vector2(jugador["cartas_arriba"].find(carta_data) * 80, 10)
			#card_instance.colision.disabled = true
			#card_instance.owner_id = jugador["peer_id"]
	#print("CARTAS EN PANTALLA")
#
#@rpc("any_peer")
#func recibir_datos(datos_player):
	#print("📦 Cliente recibió sus datos:", datos_player)

func get_card_value(card_name):
	#var name = card.card_name
	var parts = card_name.split(" ")
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

func play_card(peer_id, cartas):
	print("VALIDANDO LA JUGADA RECIBIDA: ", cartas)
	print("MANDADO POR EL USUARIO", peer_id)
	var jugada_valida = false
	var cartas_a_eliminar_de_mano = []
	for jugador in jugadores:
		if peer_id == jugador["peer_id"]:
			var mano = jugador["mano"]
			var cartas_abajo = jugador["cartas_abajo"]
			var cartas_arriba = jugador["cartas_arriba"]
			for carta_id in cartas:
				for carta in mano:
					if carta_id == carta["id"]:
						print("ENCONTRE LA CARTA: ", carta["name"])
						var opcion = validacion_jugada(carta)
						if opcion == 0 or opcion == 2 or opcion == 4:
							descarte_dict.append(carta)
							cartas_a_eliminar_de_mano.append(carta)
							jugada_valida = true
						elif opcion == 1 or opcion == 3:
							descarte_dict.append(carta)
							cartas_a_eliminar_de_mano.append(carta)
							descarte_dict.clear()
							jugada_valida = true
						elif opcion == 5:
							jugada_valida = false
						break
						
			# Una vez fuera del bucle de cartas en mano, eliminamos las cartas marcadas
			for carta_a_eliminar in cartas_a_eliminar_de_mano:
				mano.erase(carta_a_eliminar)
				
	if jugada_valida:
		for jugador in jugadores:
			var id = jugador["peer_id"]
			Bridge.rpc_id(id, "respuesta_accept_juego", descarte_dict, jugadores)
			print("Enviando datos de cartas a peer_id: ", id)
	else:
		var mensaje = "NO PUEDES HACER ESO"
		Bridge.rpc_id(peer_id, "respuesta_rechazada_juego", mensaje)
				#for carta in cartas_arriba:
					#if carta_id == carta["id"]:
						#print("ENCONTRE LA CARTA: ", carta["name"])
						#break
				#for carta in cartas_abajo:
					#if carta_id == carta["id"]:
						#print("ENCONTRE LA CARTA: ", carta["name"])
						#break
	
func validacion_jugada(carta):
	var ultima_carta_descarte = 0
	var valor_carta = get_card_value(carta["name"])
	if descarte_dict == []:
		ultima_carta_descarte = 0
	else:
		pass

	if ultima_carta_descarte == 0:
		print("JUGANDO LA(S) CARTA(S)")
		return 0
	elif valor_carta == 10:
		print("ELIMINANDO EL MONTO DE CARTAS")
		return 1
	elif valor_carta == 2:
		print("SE PUEDE TIRAR UNA CARTA MAS")
		return 2
	elif ultima_carta_descarte == 10:
		print("ELIMINANDO LA CARTA INICIAL")
		return 3
	elif valor_carta >= ultima_carta_descarte:
		print("JUGANDO LA(S) CARTA(S)")
		return 4
	elif valor_carta < ultima_carta_descarte:
		print("NO PUEDES JUGAR ESTA CARTA")
		return 5
		
