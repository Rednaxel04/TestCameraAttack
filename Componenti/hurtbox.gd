extends Component3D

class_name HurtBoxComponent


@export var _character: Enemy

#quando la HurtBox collide con una HitBox ("AttackComponent"), fa cose
#per ora chiama solo il SETTER degli HP del nodo associato a questa componente
#il SETTER sarebbe forse meglio chiamarlo dall'attaccante in caso di attacchi con diversi modificatori
#di danno
func _on_hurtbox_collision_area_entered(area: Area3D) -> void:
	print(area.get_parent().get_class_name())
	if area.get_parent().get_class_name() == "AttackComponent":
		print(_character, " GOT HIT BY ", area)
		_character.set_hp(-1)
		
