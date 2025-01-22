extends Area2D

@onready var fall_sound_player: AudioStreamPlayer2D = %FallSoundPlayer
@onready var timer: Timer = %Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Correct way to connect the timeout signal
	timer.timeout.connect(_on_timer_timeout)  # Use callable directly
	
	# Ensure the fall sound player is added to the audio group
	fall_sound_player.add_to_group("audio_players")

# Trigger when a body enters the Area2D
func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		# Play the fall sound effect when the player enters the area
		if fall_sound_player:
			fall_sound_player.play()  # Play the fall sound effect
		
		# Stop all sounds except the fall sound effect
		stop_all_sounds_except(fall_sound_player)

		# Start the timer to pause for 2.5 seconds
		timer.start(2.5)

# Function to stop all audio players except the fall sound player
func stop_all_sounds_except(excluded_player: AudioStreamPlayer2D) -> void:
	# Iterate over all AudioStreamPlayer2D nodes in the current scene
	for player in get_tree().get_nodes_in_group("audio_players"):
		# If it's not the excluded player, stop it
		if player != excluded_player and player is AudioStreamPlayer2D:
			player.stop()

# Function to reload the scene after the timer finishes
func _on_timer_timeout() -> void:
	# Reload the current scene
	get_tree().reload_current_scene()
