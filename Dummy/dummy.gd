extends Node3D

class_name Enemy

@onready var health_component = $HealthComponent

#@export var HP:int = 3
#
#
##SETTER degli HP
##al raggiungimento dei 0HP (o meno) viene triggerata la morte dell'enemy
#func set_hp(val:int):
	#if HP > 0:
		#HP += val
	#else:
		


func _on_health_component_no_health():
	#TEMP: Simulazione di morte (viene spedita a fanculo e diventa invisibile)
	self.visible = false
	self.position = Vector3(10000, 10000, 10000)


func _on_hurtbox_hit_landed():
	health_component.set_hp(-1)
