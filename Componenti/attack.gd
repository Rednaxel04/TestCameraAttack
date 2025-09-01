extends Node

class_name AttackComponent

@export var character: CharacterBody3D

@onready var hit_box: Area3D = $HitBox
@onready var collision_shape_3d: CollisionShape3D = $HitBox/CollisionShape3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hit_box.position = character.get_hitbox_dir()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED and event.is_action_pressed("LeftClick"):
		hit_box.position = character.get_hitbox_dir()
		print(hit_box.position)
		collision_shape_3d.disabled = false
		get_tree().create_timer(0.3).timeout
		collision_shape_3d.disabled = true
		


func _on_hit_box_area_entered(area: Area3D) -> void:
	if area.is_class("HurtBoxComponent"):
		print("HIT ", area)
