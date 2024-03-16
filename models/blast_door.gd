class_name BlastDoor

extends Node3D


func open() -> void:
	$AnimationPlayer.play("open")
	
