extends RigidBody2D
@onready var game_manager: Node = %Game_Manager
@onready var damage_sound_player: AudioStreamPlayer2D = $DamageSoundPlayer  # Adjust path if needed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		var y_delta = position.y - body.position.y
		var x_delta = body.position.x - position.x
		if (y_delta > -399):
			print('Destroy Enemy')
			queue_free()
			body.jump()
		else:
			print("Player Takes Dmg")
			game_manager.decrease_health()
			if (damage_sound_player):
				damage_sound_player.play()  # Play the damage sound effect
			if (x_delta > 0):
				body.jump_side(500)
			else:
				body.jump_side(-500)
