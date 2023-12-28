extends Node
class_name MidiEventSource

signal note_on(c4_semitone: int)
signal note_off(c4_semitone: int)

func _ready():
	OS.open_midi_inputs()
	print(OS.get_connected_midi_inputs())
	#note_on.emit(2)

func _input(input_event):
	if not (input_event is InputEventMIDI):
		return
	var midi_event: InputEventMIDI = input_event
	#_print_midi_info(midi_event)
	var c4_semitone = midi_event.pitch - 60
	if midi_event.message == MIDI_MESSAGE_NOTE_ON:
		note_on.emit(c4_semitone)
	elif midi_event.message == MIDI_MESSAGE_NOTE_OFF:
		note_off.emit(c4_semitone)

func _print_midi_info(midi_event: InputEventMIDI):
	print(midi_event)
	print("Channel: " + str(midi_event.channel))
	print("Message: " + str(midi_event.message))
	print("Pitch: " + str(midi_event.pitch))
	print("Velocity: " + str(midi_event.velocity))
	print("Instrument: " + str(midi_event.instrument))
	print("Pressure: " + str(midi_event.pressure))
	print("Controller number: " + str(midi_event.controller_number))
	print("Controller value: " + str(midi_event.controller_value))
