extends Node2D

#@onready var synchronizer = $MultiplayerSynchronizer
#var peer_id := -1
#var es_local := false

#func _ready():
	#if multiplayer.is_server():
		#set_multiplayer_authority(get_multiplayer_authority())
#
#func configurar(id: int):
	#peer_id = id
	#if multiplayer.has_multiplayer_peer():
		#es_local = multiplayer.get_unique_id() == peer_id
	#else:
		#es_local = false
		#print("⚠️ multiplayer_peer aún no está listo")
	#
	#if es_local:
		#print("⚡ Este nodo es controlado localmente (yo): ", name)
	#else:
		#print("👀 Nodo remoto (otro jugador): ", name)
