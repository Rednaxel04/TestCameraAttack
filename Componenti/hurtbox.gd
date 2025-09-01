extends Node

class_name HurtBoxComponent

@export var character: Enemy

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_hurtbox_collision_area_entered(area: Area3D) -> void:
	if area.is_class("AttackComponent"):
		print(character, " GOT HIT BY ", area)
		character.set_hp(1)
		
