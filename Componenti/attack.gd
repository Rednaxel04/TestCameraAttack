extends Component3D

class_name AttackComponent

@export var _character: CharacterBody3D

@onready var _hit_box: Area3D = $HitBox
@onready var collision_shape_3d: CollisionShape3D = $HitBox/CollisionShape3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(class_name_)
	self.global_position = _character.get_hitbox_dir()


func _input(event: InputEvent) -> void:
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED and event.is_action_pressed("LeftClick"):
		self.global_position = _character.get_hitbox_dir()
		print(self.position)
		collision_shape_3d.disabled = false
		await get_tree().create_timer(0.3).timeout
		collision_shape_3d.disabled = true
		


func _on__hit_box_area_entered(area: Area3D) -> void:
	if area.get_parent().get_class_name() == "HurtBoxComponent":
		print("HIT ", area)
