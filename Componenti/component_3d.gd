extends Node3D
class_name Component3D

var class_name_:String

func _init() -> void:
	class_name_ = self.get_script().get_global_name()

func get_class_name() -> String:
	return class_name_
