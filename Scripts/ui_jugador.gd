# UiJugador.gd
extends Control

@onready var mano_node = $Mano # Ruta al nodo que contendrá las cartas de la mano
@onready var abajo_node = $CartasAbajo # Ruta al nodo que contendrá las cartas "abajo"
@onready var arriba_node = $CartasArriba # Ruta al nodo que contendrá las cartas "arriba"

var local_player_data = {} # Almacena los datos de este jugador (mano, cartas_abajo, etc.)

func _ready():
	# Este print te ayudará a ver qué instancia se está inicializando
	# y si es la del servidor (peer ID 1) o de un cliente (peer ID > 1).
	print("🧩 UiJugador '{name}' (_ready). Peer ID local del sistema: {multiplayer.get_unique_id()}")
	
	# Asegurarse de que los nodos de las cartas existan
	if not is_instance_valid(mano_node) or not is_instance_valid(abajo_node) or not is_instance_valid(arriba_node):
		printerr("ERROR: Nodos de cartas (Mano, CartasAbajo, CartasArriba) no encontrados en UiJugador.")

# Esta función es la que se llama LOCALMENTE para actualizar la UI.
# NO es un RPC. El servidor la llama directamente en sus instancias de UiJugador.
# El ClientePrincipal.gd la llama en su instancia local de UiJugador.
func actualizar_interfaz(datos_del_jugador: Dictionary):
	print("✅ UiJugador '{name}' (actualizar_interfaz) recibiendo datos para peer_id: {datos_del_jugador.get('peer_id')}")
	
	# Guarda los datos recibidos para futuras referencias
	local_player_data = datos_del_jugador
	
	# --- Lógica para mostrar las cartas en la UI ---
	# Esta lógica es la que tienes y debería seguir funcionando igual.
	
# Puedes añadir otras funciones aquí, como por ejemplo:
# func _on_card_clicked(card_id: int):
# 	# Si esta UiJugador es la del cliente local, y se hace clic en una carta de su mano,
# 	# podría enviar un RPC al servidor para jugar esa carta.
# 	if multiplayer.get_unique_id() == local_player_data.get("peer_id"):
# 		# multiplayer.rpc_id(1, "jugar_carta", card_id) # El servidor (ID 1) recibe el RPC
# 		pass
