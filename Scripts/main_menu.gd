extends Control

@onready var exit_button: Button = $Button3  # Use $ to reference the button node directly

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	if exit_button:
		# Connect the "pressed" signal to the _on_exit_pressed method directly
		exit_button.pressed.connect(_on_exit_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame
func _process(_delta: float) -> void:
	pass

# Called when the "Start" button is pressed (assuming the button is correctly connected)
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level-1.tscn")

# Called when the "Exit" button is pressed
func _on_exit_pressed() -> void:
	get_tree().quit()  # This will quit the game
