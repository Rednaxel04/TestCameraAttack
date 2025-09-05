extends Node3D


# Cattura il cursore del mouse
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


# Al click della finestra cattura il cursole del mouse
# Alla pressione di "Esc" ridà il controllo del mouse all'utente
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Esc"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if get_window().has_focus() and event.is_action_pressed("LeftClick"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
