extends Control
class_name PianoKey


@export var semitone:int = 0

enum KeyType {WHITE_KEY, BLACK_KEY}
@export var keyType:KeyType = KeyType.WHITE_KEY

signal key_on(semitone: int)
signal key_off(semitone: int)

# press key (triggered by mouse click or midi event)
func pushed():
	print('%s type key emit keyOn semitone=' % keyType, semitone)
	key_on.emit(semitone)

# release key (triggered by mouse release or midi)
func released():
	print('%s type key emit keyOFF semitone=' % keyType, semitone)
	key_off.emit(semitone)


## Called when the node enters the scene tree for the first time.
#func _ready():
#


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
