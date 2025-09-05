extends Node3D
class_name Component3D

#Classe per Componente 3D per favorire la composizione di composizione
#Da usare esclusivamente per venir espansa da un'altra classe/nodo

var class_name_:String

#_init è il costruttore
func _init() -> void:
	class_name_ = self.get_script().get_global_name()		#self.get_script().get_global_name() ritorna la striga "Component3D" (il class_name)


#la funzione di base get_class restituisce il nome della classe padre, non il proprio class_name
#questa funzione restituisce il class_name
func get_class_name() -> String:
	return class_name_
