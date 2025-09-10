extends Component3D

class_name AttackComponent

@export var _character: CharacterBody3D

@onready var _hit_box: Area3D = $HitBox
@onready var collision_shape_3d: CollisionShape3D = $HitBox/CollisionShape3D

var stat_arma

var attacking : bool = false

#Questa componente più che un nodo di attacco è una componente per una HitBox per un attacco bianco,
#ma questo è venuto fuori poi mentre ci lavoravo

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(class_name_)
	self.global_position = _character.get_hitbox_dir()


func _input(event: InputEvent) -> void:
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED and event.is_action_pressed("LeftClick") and not attacking:
		self.global_position = _character.get_hitbox_dir()
		print(self.position)
		
		#SIMULAZIONE di un attacco
		collision_shape_3d.disabled = false
		attacking = true
		await get_tree().create_timer(0.3).timeout
		collision_shape_3d.disabled = true
		attacking = false
		#mancando le animazioni il tempo d'attacco della hitbox è gestito da un timer di 0.3 secondi


#quando la HitBox collide con una HurtBox, fa cose (per ora nulla)
func _on__hit_box_area_entered(area: Area3D) -> void:
	if area.get_parent().get_class_name() == "HurtBoxComponent":
		print("HIT ", area)
