extends Control
class_name Piano

@export var octave:int = 0
@export var midi_event_source: MidiEventSource

signal tone_on(c4_semitone: int)
signal tone_off(c4_semitone: int)

# press key (triggered by external midi)
func key_pushed(c4_semitones):
	#print('piano got ', semi_offset + semi)
	tone_on.emit(c4_semitones)

# release key (triggered by external midi)
func key_released(c4_semitones):
	#print('piano released ', semi_offset + semi)
	tone_off.emit(c4_semitones)

# Called when the node enters the scene tree for the first time.
func _ready(): 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
