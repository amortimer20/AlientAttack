extends CharacterBody2D


var rocket_scene: PackedScene = preload("res://scenes/rocket.tscn")

func _process(delta):
	if Input.is_action_just_pressed("fire"):
		fire()

func _physics_process(_delta):
	var speed := 300
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		velocity.x = speed
	if Input.is_action_pressed("left"):
		velocity.x = -speed
	if Input.is_action_pressed("down"):
		velocity.y = speed
	if Input.is_action_pressed("up"):
		velocity.y = -speed
	
	move_and_slide()
	global_position = global_position.clamp(Vector2.ZERO, get_viewport_rect().size)

func fire():
	print("Fire rocket")
	var rocket_instance: Area2D = rocket_scene.instantiate()
	add_child(rocket_instance)
	rocket_instance.global_position.x += 75
