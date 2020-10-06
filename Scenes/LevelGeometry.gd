extends Node2D

export var rotsp : float = 3
var rotating := false

func _physics_process(delta):
	if rotating:
		rotation_degrees += rotsp
