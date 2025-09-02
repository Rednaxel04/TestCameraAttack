extends Component3D

class_name HurtBoxComponent


@export var _character: Enemy

func _on_hurtbox_collision_area_entered(area: Area3D) -> void:
	print(area.get_parent().get_class_name())
	if area.get_parent().get_class_name() == "AttackComponent":
		print(_character, " GOT HIT BY ", area)
		_character.set_hp(1)
		
