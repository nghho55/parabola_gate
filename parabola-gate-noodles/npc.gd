extends CharacterBody2D

const SPEED = 500.0

@onready var marker_a = get_parent().get_node("Marker2D")
@onready var marker_b = get_parent().get_node("Marker2D2")

@onready var points = [
	marker_a.global_position,
	marker_b.global_position
]

var current_target := 0
var waiting := false
var stopped_at_middle := false

func _physics_process(delta: float) -> void:
	if waiting:
		velocity = Vector2.ZERO
		return
	
	var target = points[current_target]
	var midpoint = (points[0] + points[1]) / 2.0
	
	velocity = global_position.direction_to(target) * SPEED
	move_and_slide()
	
	# Stop at midpoint
	if !stopped_at_middle and global_position.distance_to(midpoint) < 10:
		stopped_at_middle = true
		pause_for_15_seconds()
		$"../Speak".visible = true
	
	# Reached destination marker
	if global_position.distance_to(target) < 10:
		current_target = (current_target + 1) % points.size()
		stopped_at_middle = false

func pause_for_15_seconds() -> void:
	waiting = true
	await get_tree().create_timer(15.0).timeout
	$"../Speak".visible = false
	waiting = false
