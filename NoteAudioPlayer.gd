extends Node


func _pitch_scale(c4_semitones:int) -> float:
	var exponent := (c4_semitones) / 12.0
	return pow(2, exponent)

func play_oneshot(c4_semitones: int):
	var audio := AudioStreamPlayer.new()
	add_child(audio)
	audio.stream = preload("res://piano/C4.wav")
	audio.pitch_scale = _pitch_scale(c4_semitones)
	audio.play()
	await get_tree().create_timer(8.0).timeout
	audio.queue_free()


## Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
