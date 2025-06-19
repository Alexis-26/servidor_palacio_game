extends Node

@rpc("any_peer")
func recibir_datos(jugadores: Dictionary) -> void:
	print("📦 Bridge recibió datos del servidor:", jugadores)

	var cliente = get_node_or_null("/root/ClientePrincipal")
	if cliente and cliente.has_method("procesar_datos"):
		cliente.procesar_datos(jugadores)
	else:
		printerr("❌ No se encontró ClientePrincipal o la función procesar_datos.")

@rpc("any_peer")
func jugar_cartas(peer_id, cartas):
	print("ENVIANDO JUGADA AL SERVIDOR")
	var game_manager = get_node_or_null("/root/Servidor/GameManager")
	if game_manager and game_manager.has_method("play_card"):
		game_manager.play_card(peer_id, cartas)
	else:
		printerr("❌ No se encontró GameManager o la función procesar_datos.")

@rpc("any_peer")
func respuesta_accept_juego(descarte, jugadores):
	print("RECIBIENDO Y ENVIANDO LA ACEPTACION DE TU JUGADA")
	var cliente = get_node_or_null("/root/ClientePrincipal")
	if cliente and cliente.has_method("respuesta_accept_juego"):
		cliente.respuesta_accept_juego(descarte, jugadores)
	else:
		printerr("❌ No se encontró ClientePrincipal o la función procesar_datos.")

@rpc("any_peer")
func respuesta_rechazada_juego(mensaje):
	print("RECIBIENDO Y ENVIANDO LA ACEPTACION DE TU JUGADA")
	var cliente = get_node_or_null("/root/ClientePrincipal")
	if cliente and cliente.has_method("respuesta_rechaza_juego"):
		cliente.respuesta_rechaza_juego(mensaje)
	else:
		printerr("❌ No se encontró ClientePrincipal o la función procesar_datos.")
