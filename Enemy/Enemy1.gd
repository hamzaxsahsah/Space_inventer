extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 200
export var explosion:PackedScene
var velocity = Vector2(0,speed) 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)


func move(delta):
	position =  position + velocity * delta


func destroy():
	queue_free()
	var new_explosion = explosion.instance()
	new_explosion.position = position
	get_parent().add_child(new_explosion)
