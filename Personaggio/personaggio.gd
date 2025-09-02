extends CharacterBody3D

@export_category("Movement")
@export var SPEED = 5.0
@export var JUMP_VELOCITY = 4.5

@onready var animated_sprite_3d: AnimatedSprite3D = $AnimatedSprite3D

enum hitbox_pos {
	North,
	South,
	West,
	East
}

var current_dir = hitbox_pos.South

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("Left", "Right", "Up", "Down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func _input(event: InputEvent) -> void:
	var input_dir := Input.get_vector("Left", "Right", "Up", "Down")
	get_animation(input_dir.x, input_dir.y)


func get_animation(x:float, y:float):
	if x == 0 and y == 0:
		animated_sprite_3d.play("IdleFront")
		match current_dir:
			hitbox_pos.West:
				animated_sprite_3d.play("IdleSide")
			hitbox_pos.East:
				animated_sprite_3d.play("IdleSide")
			hitbox_pos.South:
				animated_sprite_3d.play("IdleFront")
			hitbox_pos.North:
				animated_sprite_3d.play("IdleBack")
	if abs(x) == 1 and y == 0:		#right or left
		animated_sprite_3d.play("WalkingSide")
		if x > 0:
			current_dir = hitbox_pos.East
			animated_sprite_3d.flip_h = true
		else:
			current_dir = hitbox_pos.West
			animated_sprite_3d.flip_h = false
	if abs(y) == 1:					#up or down
		if y > 0:
			current_dir = hitbox_pos.South
			animated_sprite_3d.play("WalkingFront")
		else:
			current_dir = hitbox_pos.North
			animated_sprite_3d.play("WalkingBack")


func get_hitbox_dir():
	match current_dir:
		hitbox_pos.West:
			return $AnimatedSprite3D/PosHitboxW.global_position
		hitbox_pos.East:
			return $AnimatedSprite3D/PosHitboxE.global_position
		hitbox_pos.South:
			return $AnimatedSprite3D/PosHitboxS.global_position
		hitbox_pos.North:
			return $AnimatedSprite3D/PosHitboxN.global_position
		
