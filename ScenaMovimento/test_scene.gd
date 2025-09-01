extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Esc"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if get_window().has_focus() and event.is_action_pressed("LeftClick"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
