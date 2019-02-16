extends KinematicBody2D

const MOVE_SPEED = 300
const ROT_SPEED = 1

func _physics_process(delta):
	var move_vec = Vector2()
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		move_vec = Vector2(cos(global_rotation), sin(global_rotation))
	elif Input.is_action_pressed("ui_up"):
		global_rotation += ROT_SPEED * delta
	elif Input.is_action_pressed("ui_down"):
		global_rotation -= ROT_SPEED * delta
	move_vec = move_vec.normalized()
	move_and_collide(move_vec* MOVE_SPEED * delta)

func kill():
	get_tree().reload_current_scene()