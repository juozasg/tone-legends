extends Control

@export var octave = 0;

# press key (triggered by external midi)
func keyPressed(ev):
	print('piano got ', ev)


# release key (triggered by external midi)
func keyReleased(ev):
	print('piano release ', ev)

# Called when the node enters the scene tree for the first time.
func _ready(): 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
