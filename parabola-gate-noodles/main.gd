extends Node
@onready var gate: Area2D = $Gate
@onready var main_player_area: Area2D = $MainPlayer/Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Connect the area2d gate area_entered signal to our func via code
	gate.area_entered.connect(_on_gate_area_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_gate_area_entered(a: Area2D):
	if a == main_player_area:
		get_tree().change_scene_to_file("res://restaurant.tscn")
