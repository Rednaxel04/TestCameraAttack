extends Node3D

class_name Enemy

@export var HP:int = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_hp(val:int):
	if HP >= 0:
		HP -= val
	else:
		self.position = Vector3(10000, 10000, 10000)
		self.visible = false
