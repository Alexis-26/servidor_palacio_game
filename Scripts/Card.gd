extends Node2D

## Propiedades de la carta
#var card_id = 0
#var card_name = ""
#var front_texture: Texture
##var back_texture: Texture
#@onready var colision: CollisionShape2D = $CollisionShape2D
#
#var is_face_up: bool
#var is_in_hand:bool
#var is_selected: bool = false
#
#func _ready():
	#update_texture()
#
#func flip_card():
	#is_face_up = !is_face_up
	#update_texture()
#
#func select_card():
	#var tween = get_tree().create_tween()
	#if not is_selected:
		#is_selected = true
		## Subir la carta un poco (animación opcional con Tween)
		#tween.tween_property(self, "position:y", position.y - 40, 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
#
	#else:
		#is_selected = false
		## Bajar la carta a su posición original
		#tween.tween_property(self, "position:y", position.y + 40, 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
#
#func update_texture():
	#if is_face_up:
		#$Textura.texture = front_texture
	#else:
		#$Textura.texture = load("res://assets/Cards (large)/card_back.png")
#
## Detectar clic en la carta
#func _input_event(viewport, event, shape_idx):
	#if event is InputEventMouseButton and event.pressed:
		#var game_manager = get_tree().get_root().get_node("Multijugador/GameManager")
		#game_manager.rpc_id(1, "on_card_selected", self)
		##get_tree().call_group("game_manager", "on_card_selected", self)



# Propiedades de la carta
var card_id = 0
var card_name = ""
var front_texture: Texture
var owner_id: int = -1  # ID del jugador dueño de la carta
@onready var colision: CollisionShape2D = $CollisionShape2D

var is_face_up: bool
var is_in_hand: bool
var is_selected: bool = false

func _ready():
	update_texture()

func flip_card():
	is_face_up = !is_face_up
	update_texture()

func select_card():
	var tween = get_tree().create_tween()
	if not is_selected:
		is_selected = true
		tween.tween_property(self, "position:y", position.y - 40, 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	else:
		is_selected = false
		tween.tween_property(self, "position:y", position.y + 40, 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)

func update_texture():
	if is_face_up:
		$Textura.texture = front_texture
	else:
		$Textura.texture = load("res://assets/Cards (large)/card_back.png")

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if multiplayer.get_unique_id() == owner_id:
			var game_manager = get_tree().get_root().get_node("Multijugador/GameManager")
			game_manager.on_card_selected(self)  # Llama localmente, que el GameManager decida si usar RPC
