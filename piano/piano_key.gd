extends Control
class_name PianoKey


@export var semitone:int = 0

enum KeyType {WHITE_KEY, BLACK_KEY}
@export var keyType:KeyType = KeyType.WHITE_KEY

@onready var piano = $'..'


signal keyOn(semitone: int)
signal keyOff(semitone: int)

# press key (triggered by external midi)
func keyPressed():
	print('%s type key emit keyOn semitone=' % keyType, semitone)
	keyOn.emit(semitone)

# release key (triggered by external midi)
func keyReleased():
	print('%s type key emit keyOFF semitone=' % keyType, semitone)
	keyOff.emit(semitone)

# Called when the node enters the scene tree for the first time.
func _ready():
	keyOn.connect(piano.keyPressed)
	keyOff.connect(piano.keyReleased)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
