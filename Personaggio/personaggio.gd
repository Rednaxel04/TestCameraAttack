extends CharacterBody3D

@export_category("Movement")
@export var SPEED := 5.0
@export var JUMP_VELOCITY := 4.5

@onready var animated_sprite_3d: AnimatedSprite3D = $AnimatedSprite3D
@onready var health_component = $HealthComponent


enum hitbox_pos {
	North,	#0
	South,	#1
	West,	#2
	East	#3
}

var current_dir := hitbox_pos.South

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
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
	#ad ogni input (da tastiera e da mouse) viene chiamata la funzione che fa partire l'animazione
	var input_dir := Input.get_vector("Left", "Right", "Up", "Down")
	get_animation(input_dir.x, input_dir.y)


func get_animation(x:float, y:float):
	#il pattern matching di Godot è parecchio limitato, quindi:
	
	#quando il pg è FERMO viene scelta la idle in base alla sua direzione
	if x == 0 and y == 0:
		match current_dir:
			hitbox_pos.West:
				animated_sprite_3d.play("IdleSide")
			hitbox_pos.East:
				animated_sprite_3d.play("IdleSide")
			hitbox_pos.South:
				animated_sprite_3d.play("IdleFront")
			hitbox_pos.North:
				animated_sprite_3d.play("IdleBack")
	
	#quando il pg cammina verso DESTRA o SINISTRA viene chiamata l'apposita animazione e il modello
	#viene specchiato in base alla direzione verso cui cammina  
	if abs(x) == 1 and y == 0:
		animated_sprite_3d.play("WalkingSide")
		if x > 0:
			current_dir = hitbox_pos.East
			animated_sprite_3d.flip_h = true
		else:
			current_dir = hitbox_pos.West
			animated_sprite_3d.flip_h = false
	
	#quando il pg cammina verso l'ALTO o BASSO viene chiamata l'apposita animazione
	#se anche il personaggio cammina in alto(basso) a destra(sinistra), viene comunque
	#chiamata l'animazione verso l'alto(basso)
	if abs(y) == 1:					#up or down
		if y > 0:
			current_dir = hitbox_pos.South
			animated_sprite_3d.play("WalkingFront")
		else:
			current_dir = hitbox_pos.North
			animated_sprite_3d.play("WalkingBack")


#Il pg ha 4 nodi intorno che segnano la posizione possibile della HitBox per l'attacco bianco
#la funzione get_hitbox_dir restituisce la posizione di quel nodo in base alla direzione del pg
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


func _on_health_component_no_health():
	#FAILSTATE TBD
	print("FAILSTATE")
