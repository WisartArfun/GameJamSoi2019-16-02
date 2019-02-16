extends KinematicBody2D

const MOVE_SPEED = 200

var player = null

func _ready():
	add_to_group("zombies")
	player = get_node("../Player")

func _physics_process(delta):
	if player == null:
		return
	
	var vec_to_player = player.global_position - global_position
	vec_to_player = vec_to_player.normalized()
	global_rotation = atan2(vec_to_player.y, vec_to_player.x)
	var collision = move_and_collide(vec_to_player * MOVE_SPEED * delta * 0)
	if collision:
		print(collision)
		print(collision.collider.get_name())

func die():
	queue_free()

func set_player(p):
	player = p