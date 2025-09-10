extends Node3D

class_name Enemy

@onready var health_component = $HealthComponent


func _on_health_component_no_health():
	#TEMP: Simulazione di morte (viene spedita a fanculo e diventa invisibile)
	self.visible = false
	self.position = Vector3(10000, 10000, 10000)


func _on_hurtbox_hit_landed():
	health_component.set_hp(-1)
	print("Health Remaining: ", health_component.get_hp())
