extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Trigger when a body enters the Area2D
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		# Change the scene to "game-done.tscn"
		get_tree().change_scene_to_file("res://Scenes/game-done.tscn")
