extends CharacterBody2D


const SPEED = 150
const JUMP_VELOCITY = -400.0
var currentAnimation: String;


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

		# Handle jump.
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right");
	
	if direction < 0:
		$PlayerImage.scale.x = -1;
		$PlayerImage.position.x = -15;
	
	if direction > 0:
		$PlayerImage.scale.x = 1;
		$PlayerImage.position.x = 0;
	
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED);
		
	if direction == 0 and is_on_floor():
		currentAnimation = 'Idle';
	else: if direction and is_on_floor():
		currentAnimation = 'Walk';
	else:
		currentAnimation = 'Jump';
		
	$PlayerImage.play(currentAnimation);

	move_and_slide()
