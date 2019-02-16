extends KinematicBody2D

const MOVE_SPEED = 300
const ROT_SPEED = 2

func _physics_process(delta):
	var move_vec = Vector2()
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		move_vec = Vector2(cos(global_rotation), sin(global_rotation)) * MOVE_SPEED
	elif Input.is_action_pressed("ui_up"):
		global_rotation += ROT_SPEED * delta
		move_vec = Vector2(cos(global_rotation), sin(global_rotation)) * 200 * ROT_SPEED
	elif Input.is_action_pressed("ui_down"):
		global_rotation -= ROT_SPEED * delta
	
	move_and_collide(move_vec * delta)

func kill():
	get_tree().reload_current_scene()
