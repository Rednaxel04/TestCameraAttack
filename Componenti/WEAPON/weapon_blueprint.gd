extends Component
class_name Weapon

var damage:int
var w_name: String
var descr: String

func _init(dmg: int, wn: String, desc: String):
	damage = dmg
	w_name = wn
	descr = desc

func get_attribute(attr_n: String):
	match attr_n:
		"dmg":
			return damage
		"name":
			return w_name
		"dsc":
			return descr
		_:
			print("ERRORE | ATTRIBUTO NON ESISTENTE")
