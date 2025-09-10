extends Component
class_name HealthComponent

signal no_health

@export var max_health:int
var current_health:int

func _ready():
	#questo bisognerebbe sistemarlo, ad ogni cambio di scena resetta il counter degli hp settandoli al massimo
	current_health = max_health

#GETTER degli hp
func get_hp() -> int:
	return current_health

#SETTER degli hp
func set_hp(off: int) -> void:
	var n_hp = current_health + off
	if n_hp > 0 and n_hp < max_health:		#SE gli hp sono negativi E gli hp sono meno del massimo
		current_health = n_hp
	elif n_hp < 0:
		emit_signal("no_health")
	elif n_hp > max_health:
		current_health = max_health
