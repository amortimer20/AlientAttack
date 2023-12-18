extends Area2D

@export var speed := 300

func _physics_process(delta):
	translate(Vector2(speed * delta, 0))
