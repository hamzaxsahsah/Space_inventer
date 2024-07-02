extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 200 # Speed of the character
var velocity = Vector2() # Character's velocity
var screen_size = Vector2() # Screen size
export var projectile:PackedScene
export var explosion:PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)
	shoot()





func move(delta):
	velocity = Vector2()
	
	# Check for input and adjust the velocity accordingly
	if Input.is_action_pressed("ui_up"):
		velocity.y -= speed
	if Input.is_action_pressed("ui_down"):
		velocity.y += speed
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	
	# Move the character
	
	var new_position = Vector2() 
	new_position = position + velocity * delta
	
	# Clamp the new position to the screen size
	new_position.x = clamp(new_position.x, 0, screen_size.x)
	new_position.y = clamp(new_position.y, 0, screen_size.y)
	
	# Apply the clamped position
	position = new_position

func shoot():
	if Input.is_action_just_pressed("ui_select"):
		print("shoot")
		var new_projectile = projectile.instance()
		new_projectile.position = position
		get_parent().add_child(new_projectile)
		
	
func destroy():
	queue_free()
	var new_explosion = explosion.instance()
	new_explosion.position = position
	get_parent().add_child(new_explosion)
	

func _on_Spaceship_area_entered(area):
	if area.name == "Enemy":
		 destroy()
		
