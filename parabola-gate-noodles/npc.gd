extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -400.0

var point_a = $MarkerA.global_position
var point_b = $MarkerB.global_position
var middle = (point_a + point_b) / 2.0

@onready var points = [point_a, middle, point_b]

var current_target := 0
var waiting = false

func _physics_process(delta: float) -> void:
	if waiting:
		velocity = Vector2.ZERO
		return
	
	var target = points[current_target]
	velocity = global_position.direction_to(target) * SPEED
	move_and_slide()
	
	if global_position.distance_to(target) < 400:
		waiting = true
		await get_tree().create_timer(2.0).timeout
		current_target = (current_target + 1) % points.size()
		waiting = false
