extends Area2D

# Declare member variables
export var speed = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)

func move(delta):
	position.y -= speed * delta


func _on_laser_area_entered(area):
	if area.name == "Enemy":
		area.destroy()
		queue_free()
