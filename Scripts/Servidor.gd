# servidor.gd
extends Node # Adjunto al nodo raíz 'Servidor'

@onready var hud = $VBoxContainer # Tus botones Host/Join
@onready var gamemanager = $GameManager # Referencia al nodo GameManager

var peer = ENetMultiplayerPeer.new()

func _ready():
	if OS.has_feature("dedicated_server"):
		print("Iniciando en modo servidor dedicado...")
		_iniciar_servidor_dedicado()
	else:
		hud.show()
		print("Servidor listo para recibir host o join.")

func _on_host_pressed() -> void:
	peer.create_server(3500)
	multiplayer.multiplayer_peer = peer # <-- Aquí se asigna el peer
	
	# Las señales se conectan AQUÍ, ya que este script maneja la conexión.
	multiplayer.peer_connected.connect(_on_peer_connected)
	multiplayer.peer_disconnected.connect(_on_peer_disconnected)

	print("SE INICIÓ EL HOST/SERVIDOR. Mi ID:", multiplayer.get_unique_id())
	hud.hide()

# --- REMUEVE _on_join_pressed() de aquí, eso va en el cliente ---

func _iniciar_servidor_dedicado():
	peer.create_server(3500)
	multiplayer.multiplayer_peer = peer # <-- Aquí se asigna el peer
	multiplayer.peer_connected.connect(_on_peer_connected)
	multiplayer.peer_disconnected.connect(_on_peer_disconnected)
	print("Servidor dedicado corriendo en el puerto 3500")

func _on_peer_connected(id: int):
	if multiplayer.is_server():
		# Si el host mismo se conecta, y no es un jugador, ignóralo
		if id == multiplayer.get_unique_id():
			print("El propio servidor/host se conectó. No se añade como jugador.")
			return
		
		print("CLIENTE CONECTADO con ID: ", id)
		# ¡Ahora, pasamos el ID del peer a tu GameManager!
		# El GameManager se encargará de instanciar el UiJugador y añadirlo a su lista.
		gamemanager.add_player_from_server(id) # <-- Nueva función en GameManager

func _on_peer_disconnected(id: int):
	if multiplayer.is_server():
		print("CLIENTE DESCONECTADO con ID: ", id)
		gamemanager.remove_player_from_server(id) # <-- Nueva función en GameManager

# --- REMUEVE _on_connection_failed() y _on_server_disconnected() de aquí, eso va en el cliente ---
