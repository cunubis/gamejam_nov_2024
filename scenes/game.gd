extends Node2D

var projectile_scene: PackedScene = load("res://scenes/player_projectile.tscn");

func _process(_delta):
	pass



	


func _on_player_shoot(pos, dir):
	var projectile = projectile_scene.instantiate();
	projectile.position = pos;
	projectile.direction = dir;
	$PlayerProjectiles.add_child(projectile);
