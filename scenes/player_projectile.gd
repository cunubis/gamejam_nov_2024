extends Area2D

@export var speed: int;
@export var direction: String;

func _ready():
	if direction == 'right':
		speed = 400;
	else:
		speed = -400;
	$AnimatedSprite2D.play("Create");

func _process(delta):
	position.x += speed * delta;

func _on_start_animation_finished():
	$AnimatedSprite2D.stop();
