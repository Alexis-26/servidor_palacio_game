extends Node2D
# ClientePrincipal.gd

@onready var hud_node = $VBoxContainer # Si tienes un HUD o elementos de interfaz general
@onready var status_label = $Estatus # Para mostrar mensajes de estado
@onready var mi_ui_jugador = $UiJugador # <-- ¡AJUSTA ESTA RUTA!
										   # Debe apuntar a la instancia de tu escena UiJugador
										   # que representa el jugador local en ESTA escena cliente.
										   # Por ejemplo, si es un hijo directo, será $"MiUiJugador"

var peer = ENetMultiplayerPeer.new()
var my_player_data = {} # Almacena los datos de las cartas y el peer_id de este cliente

func _ready():
	print("🚀 Cliente Principal iniciado. Mi ID de peer (antes de conectar):", multiplayer.get_unique_id())

	# Conecta las señales de multiplayer.
	multiplayer.peer_connected.connect(_on_peer_connected)
	multiplayer.peer_disconnected.connect(_on_peer_disconnected)
	multiplayer.connection_failed.connect(_on_connection_failed)
	multiplayer.server_disconnected.connect(_on_server_disconnected)
	
	# Asegúrate de que tu UiJugador local no tenga datos de cartas al inicio
	if is_instance_valid(mi_ui_jugador):
		mi_ui_jugador.actualizar_interfaz({"peer_id": multiplayer.get_unique_id(), "mano": [], "cartas_abajo": [], "cartas_arriba": []})


func _on_join_pressed() -> void:
		# Inicia la conexión como cliente
	print("Intentando conectar al servidor...")
	status_label.text = "Conectando..."
	peer.create_client("localhost", 3500) # Asegúrate de que el puerto coincida con tu servidor
	multiplayer.multiplayer_peer = peer
	
	hud_node.hide()

# --- Funciones de Callbacks de Señales de Multiplayer ---

func _on_peer_connected(id: int):
	# Este callback se ejecuta en el cliente cuando se conecta al servidor.
	# El 'id' aquí será el peer ID del servidor (generalmente 1).
	if id == multiplayer.get_unique_id():
		print("✅ Cliente se ha conectado a sí mismo (esto no debería pasar).")
	else:
		print("✅ Cliente conectado al servidor con ID: {id}. Mi ID de peer local: {multiplayer.get_unique_id()}")
		status_label.text = "Conectado al servidor. Esperando el inicio del juego..."


func _on_peer_disconnected(id: int):
	# Este callback se ejecuta en el cliente cuando el servidor se desconecta o viceversa.
	print("❌ Peer con ID: {id} se ha desconectado.")
	if id == multiplayer.get_unique_id():
		# Esto no debería suceder a menos que el cliente se desconecte a sí mismo
		print("❌ El cliente local se desconectó.")
	else:
		print("❌ El servidor se desconectó inesperadamente.")
		_return_to_main_menu("Servidor desconectado.")


func _on_connection_failed():
	print("❌ Falló la conexión al servidor.")
	status_label.text = "Fallo al conectar. Intenta de nuevo."
	_return_to_main_menu("Fallo al conectar.")


func _on_server_disconnected():
	print("❌ El servidor se ha desconectado.")
	status_label.text = "Servidor desconectado."
	_return_to_main_menu("Servidor desconectado.")


# --- Funciones RPC (llamadas por el Servidor) ---

@rpc("any_peer") # Importante: Esta función es un RPC y debe ser 'any_peer'
func recibir_datos(datos_player_remoto: Dictionary):
	# Esta función se ejecuta en el CLIENTE cuando el servidor envía datos.
	print("📦 Cliente ({multiplayer.get_unique_id()}) recibió datos del servidor.")
	
	# Verifica si los datos recibidos son para este cliente específico
	if datos_player_remoto.get("peer_id") == multiplayer.get_unique_id():
		print("🎉 Cliente ({multiplayer.get_unique_id()}) recibió SUS datos. Actualizando UI.")
		my_player_data = datos_player_remoto # Almacena los datos de tu jugador local
		
		# Pasa los datos a tu instancia local de UiJugador para que actualice la interfaz
		if is_instance_valid(mi_ui_jugador):
			mi_ui_jugador.actualizar_interfaz(my_player_data)
		else:
			printerr("❌ Error: No se encontró la instancia local de UiJugador para actualizar.")
	else:
		# Si recibimos datos de otro jugador, aquí podrías actualizar alguna UI global
		# (ej. mostrar el número de cartas de otros jugadores, sus nombres),
		# pero NUNCA instanciar sus nodos de mano o acceder a elementos de la escena del servidor.
		print("Recibidos datos de otro jugador (peer_id: {datos_player_remoto.get('peer_id')}), ignorando para mi UI.")

# --- Funciones Auxiliares ---

func _return_to_main_menu(message: String):
	# Lógica para regresar al menú principal o reiniciar el juego
	print("Volviendo al menú principal:", message)
	# Puedes añadir un Timer para que espere un poco antes de recargar
	# get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
	pass # Implementa tu lógica aquí para manejar el retorno al menú
