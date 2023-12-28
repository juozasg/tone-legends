extends Node

@onready var fill: ColorRect = $'../Fill'
@onready var start_color: Color = fill.color
@onready var piano_key: PianoKey = $'..'

func _ready():
	piano_key.key_on.connect(self.activate)
	piano_key.key_off.connect(self.deactivate)

func activate(_st):
	fill.color = (Color.DODGER_BLUE + Color.WHITE) / 2

func deactivate(_st):
	fill.color = start_color
