extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# delete object when body is entered and increment coin score to 1 after
func _on_body_entered(body: Node2D) -> void:
	queue_free()
	Global.coinScore += 1
	print("Globaler Coin Score erhoeht auf:")
	print(Global.coinScore)
