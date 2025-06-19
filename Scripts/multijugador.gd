extends Node2D

@onready var hud: VBoxContainer = $VBoxContainer
@onready var game_manager = $GameManager

var peer: ENetMultiplayerPeer = ENetMultiplayerPeer.new()
var jugadores_conectados := 0

#func _ready():
	#if OS.has_feature("server") or "--server" in OS.get_cmdline_args():
		#print("Iniciando en modo servidor dedicado...")
		#_iniciar_servidor_dedicado()

func _ready():
	if OS.has_feature("dedicated_server"):
		print("Iniciando en modo servidor dedicado...")
		_iniciar_servidor_dedicado()

func _on_host_pressed() -> void:
	peer.create_server(3500)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_on_peer_connected)

	var host_id = multiplayer.get_unique_id()
	_on_peer_connected(host_id)
	print("SE UNIÓ EL HOST:", host_id)
	hud.hide()

func _on_join_pressed() -> void:
	print("Cliente intentando conectarse al servidor...")
	peer.create_client("localhost", 3500)  # Usa tu dominio real
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_on_peer_connected)  # ✅ Línea agregada
	hud.hide()

func _iniciar_servidor_dedicado():
	peer.create_server(3500)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_on_peer_connected)

	var host_id = multiplayer.get_unique_id()
	
	if not OS.has_feature("dedicated_server"):
		_on_peer_connected(host_id)
	print("Servidor dedicado corriendo en el puerto 3500")

func _on_peer_connected(id: int):
	# Saltar si el servidor está intentando crearse a sí mismo un jugador visual
	if multiplayer.is_server() and multiplayer.get_unique_id() == id:
		print("Servidor no crea jugador visual para sí mismo.")
		return
	jugadores_conectados += 1
	var nombre_jugador = "Player" + str(jugadores_conectados)

	var nuevo_jugador = preload("res://Items/Cards/Scene/Player.tscn").instantiate()
	nuevo_jugador.name = nombre_jugador
	game_manager.add_child(nuevo_jugador)
	nuevo_jugador.configurar(id)

	# ✅ Solo replicar el jugador nuevo
	rpc("crear_jugador_local", nombre_jugador, id)

	# ✅ Cambiado para contar todos los jugadores (incluye host)
	if multiplayer.is_server() and jugadores_conectados >= 4:
		print("Todos los jugadores conectados, iniciando juego...")
		rpc("crear_gamemanager")

@rpc("call_local")
func crear_gamemanager():
	game_manager.start_game()

@rpc("any_peer", "call_local")
func crear_jugador_local(nombre_jugador: String, peer_id: int):
	if game_manager.has_node(nombre_jugador):
		return

	var nuevo_jugador = preload("res://Items/Cards/Scene/Player.tscn").instantiate()
	nuevo_jugador.name = nombre_jugador
	game_manager.add_child(nuevo_jugador)
	nuevo_jugador.configurar(peer_id)

	print("Nodo de jugador creado localmente:", nombre_jugador)


func _on_connection_failed():
	print("ERROR: No se pudo conectar al servidor")

func _on_connection_succeeded():
	print("Conexión exitosa al servidor")
