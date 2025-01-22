extends Node

@onready var audio_stream_player_2d: AudioStreamPlayer2D = %AudioStreamPlayer2D


# Called when the scene has finished loading
func _ready() -> void:
	# Play the sound effect as soon as the scene is ready
	if audio_stream_player_2d:
		audio_stream_player_2d.play()
