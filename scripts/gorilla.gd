extends CharacterBody2D

var speed = 100
var direction = Vector2.LEFT
var gravity = 500
var is_dead = false

func _ready():
	$AnimatedSprite2D.play("stomping")
	update_facing()
	#$RayCast2D.cast_to = Vector2(-20, 20)

func _process(delta):
	if is_dead:
		return
	velocity.y += gravity * delta
	velocity.x = direction.x * speed
	if is_on_floor() and (!$AnimatedSprite2D.is_playing() or $AnimatedSprite2D.animation != "stomping"):
		$AnimatedSprite2D.play("stomping")
	move_and_slide()

func reverse_direction():
	direction = -direction
	update_facing()
	#$RayCast2D.cast_to = Vector2(20, 20) if direction == Vector2.RIGHT else Vector2(-20, 20)

func _physics_process(delta):
	if is_on_wall() or not $RayCast2D.is_colliding():
		reverse_direction()

func update_facing():
	$AnimatedSprite2D.flip_h = direction == Vector2.RIGHT

func on_body_area_body_entered(body):
	if body.collision_layer == 5:
		die()

func die():
	is_dead = true
	velocity = Vector2.ZERO
	$AnimatedSprite2D.play("dead")
