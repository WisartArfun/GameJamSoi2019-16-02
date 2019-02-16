extends KinematicBody2D

const MOVE_SPEED = 300
const ROT_SPEED = 2

func _physics_process(delta):
	var move_vec = Vector2()
	if Input.is_action_pressed("p1_fw") and Input.is_action_pressed("p2_fw"):
		move_vec = Vector2(cos(global_rotation), sin(global_rotation)) * MOVE_SPEED
	elif Input.is_action_pressed("p1_fw"):
		global_rotation += ROT_SPEED * delta
		move_vec = Vector2(cos(global_rotation), sin(global_rotation)) * 200 * ROT_SPEED
	elif Input.is_action_pressed("p2_fw"):
		global_rotation -= ROT_SPEED * delta
	var collision = move_and_collide(move_vec * delta)
	if collision:
		print(collision.collider.get_name())
		if collision.collider.get_name() == "Zombie":
			kill()
		#collision.collider.die()
			 
	
	#var collider1 = get_node("coll_player1")
	#if collider1.one_way_collision()
	#	kill()

func kill():
	get_tree().reload_current_scene()
