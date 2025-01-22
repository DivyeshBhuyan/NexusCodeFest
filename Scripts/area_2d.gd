extends Area2D

# Path to the scene you want to load
var next_scene = "res://Scenes/level-2.tscn"

# Called when another body enters the flag's Area2D
func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		print("Player has touched the flag!")
		# Change the scene to the next level when the player touches the flag
		get_tree().change_scene(next_scene)
	else:
		print("Something else entered the flag area.")
