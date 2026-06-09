extends Node
@onready var in_game_menu: Area2D = $Menu
# Open/close menu Buttons
@onready var read_menu_button: Button = $MenuButton
@onready var close_menu_button: Button = $CloseButton
# Ingredients to click
@onready var bbq: Area2D = $Ingredients/BBQSauce
@onready var bee: Area2D = $Ingredients/Beef
@onready var cab: Area2D = $Ingredients/Cabbage
@onready var egg: Area2D = $Ingredients/FriedEgg
@onready var sal: Area2D = $Ingredients/Salmon
@onready var noo: Area2D = $Ingredients/Noodles
@onready var bel: Area2D = $Ingredients/BellPepper
# Ingredients to appear in bowl
@onready var bbq_b: Area2D = $IngredientsInBowl/BBQSauce
@onready var bee_b: Area2D = $IngredientsInBowl/Beef
@onready var cab_b: Area2D = $IngredientsInBowl/Cabbage
@onready var egg_b: Area2D = $IngredientsInBowl/FriedEgg
@onready var sal_b: Area2D = $IngredientsInBowl/Salmon
@onready var noo_b: Area2D = $IngredientsInBowl/Noodles
@onready var bel_b: Area2D = $IngredientsInBowl/BellPepper
# Throw away ingredients button (basically making them invisible)
@onready var throw_away: Button = $ThrowAway

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Ensure the menu is hidden when the game starts playing
	in_game_menu.visible = false
	# Connect the button's pressed signal to our custom function via code
	read_menu_button.pressed.connect(_on_open_menu_button_pressed)
	# Connect and hide the close button signal
	close_menu_button.visible = false
	close_menu_button.pressed.connect(_on_close_button_pressed)
	# Connect the area2ds' mouse_entered signal to our custom func via code
	bbq.mouse_entered.connect(_on_bbq_mouse_entered)
	bee.mouse_entered.connect(_on_bee_mouse_entered)
	cab.mouse_entered.connect(_on_cab_mouse_entered)
	egg.mouse_entered.connect(_on_egg_mouse_entered)
	sal.mouse_entered.connect(_on_sal_mouse_entered)
	noo.mouse_entered.connect(_on_noo_mouse_entered)
	bel.mouse_entered.connect(_on_bel_mouse_entered)
	# Connect the throw_away pressed signal to our custom func via code
	throw_away.pressed.connect(_on_throw_away_button_pressed)

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

func _on_bbq_mouse_entered() -> void:
	bbq_b.visible = true

func _on_bee_mouse_entered() -> void:
	bee_b.visible = true

func _on_cab_mouse_entered() -> void:
	cab_b.visible = true

func _on_egg_mouse_entered() -> void:
	egg_b.visible = true

func _on_sal_mouse_entered() -> void:
	sal_b.visible = true

func _on_noo_mouse_entered() -> void:
	noo_b.visible = true

func _on_bel_mouse_entered() -> void:
	bel_b.visible = true

func _on_throw_away_button_pressed() -> void:
	bbq_b.visible = false
	bee_b.visible = false
	cab_b.visible = false
	egg_b.visible = false
	sal_b.visible = false
	noo_b.visible = false
	bel_b.visible = false
