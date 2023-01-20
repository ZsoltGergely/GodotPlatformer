extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func update_health1(h1):
	$Health1.text = str(h1)
func update_health2(h2):
	$Health2.text = str(h2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
