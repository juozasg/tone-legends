extends Control
class_name Piano

@export var octave:int = 0
var piano_keys = {} # c4 semitone to PianoKey

signal tone_on(c4_semitone: int)
signal tone_off(c4_semitone: int)

# triggered by PianoKey signal
func key_pushed(semitone: int):
	var c4_semitone := octave * 12 + semitone
	print('piano got ', c4_semitone)
	tone_on.emit(c4_semitone)

# triggered by PianoKey signal
func key_released(semitone: int):
	#print('piano released ', semi_offset + semi)
	var c4_semitone := octave * 12 + semitone
	tone_off.emit(c4_semitone)

# triggered by MidiEventSource
func midi_note_on(c4_semitone: int):
	if(piano_keys.has(c4_semitone)):
		piano_keys[c4_semitone].pushed()

# triggered by MidiEventSource
func midi_note_off(c4_semitone: int):
	if(piano_keys.has(c4_semitone)):
		piano_keys[c4_semitone].released()

func _ready():
	#midi_events_source.note_on.connect(midi_note_on)
	#midi_events_source.note_off.connect(midi_note_off)
	var pks = get_children().filter(func(n): return n is PianoKey)
	for pk in pks:
		piano_keys[octave * 12 + pk.semitone] = pk
		pk.key_on.connect(key_pushed)
		pk.key_off.connect(key_released)

#func _process(delta):
	#pass
