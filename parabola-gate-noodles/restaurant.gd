extends Node
@onready var in_game_menu: Area2D = $Menu
@onready var read_menu_button: Button = $MenuButton
@onready var close_menu_button: Button = $CloseButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Ensure the menu is hidden when the game starts playing
	in_game_menu.visible = false
	# Connect the button's pressed signal to our custom function via code
	read_menu_button.pressed.connect(_on_open_menu_button_pressed)
	# Connect and hide the close button signal
	close_menu_button.visible = false
	close_menu_button.pressed.connect(_on_close_button_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_open_menu_button_pressed() -> void:
	# This makes the menu visible
	in_game_menu.visible = true	
	# Hide the open button so it's not behind the menu
	read_menu_button.visible = false
	# Bring the close button
	close_menu_button.visible = true

func _on_close_button_pressed() -> void:
	in_game_menu.visible = false
	read_menu_button.visible = true # Bring the open button back
	close_menu_button.visible = false # Hide the close button again
