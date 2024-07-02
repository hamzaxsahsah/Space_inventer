extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var Enemy:PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	spawn_enemy()

func spawn_enemy():
	if $Timer.is_stopped():
		var path = $Path2D
		var path_length = path.curve.get_baked_length()
		var random_offset = randf() * path_length
		
		var path_follow = PathFollow2D.new()
		path_follow.offset = random_offset
		path.add_child(path_follow)

		var enemy = Enemy.instance()
		path_follow.add_child(enemy)
		enemy.position = Vector2()
		$Timer.start()
