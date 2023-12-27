extends Control
class_name PianoKey


@export var semitone:int = 0

enum KeyType {WHITE_KEY, BLACK_KEY}
@export var keyType:KeyType = KeyType.WHITE_KEY

@onready var piano = $'..'
@onready var c4_semitone = (piano.octave * 12) + self.semitone
@onready var midi_events_source: MidiEventSource = piano.midi_event_source

signal key_on(c4_semitones: int)
signal key_off(c4_semitones: int)

# press key (triggered by mouse click or midi event)
func pushed():
	print('%s type key emit keyOn semitone=' % keyType, c4_semitone)
	key_on.emit(c4_semitone)

# release key (triggered by mouse release or midi)
func released():
	print('%s type key emit keyOFF semitone=' % keyType, c4_semitone)
	key_off.emit(c4_semitone)

func midi_note_on(_c4_semitone: int):
	if(_c4_semitone == self.c4_semitone):
		self.pushed()

func midi_note_off(_c4_semitone: int):
	if(_c4_semitone == self.c4_semitone):
		self.released()

# Called when the node enters the scene tree for the first time.
func _ready():
	key_on.connect(piano.key_pushed)
	key_off.connect(piano.key_released)
	midi_events_source.note_on.connect(self.midi_note_on)
	midi_events_source.note_off.connect(self.midi_note_off)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
