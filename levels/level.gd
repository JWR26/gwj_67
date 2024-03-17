extends Node3D

var time: float = 0

func _ready() -> void:
	Persistants.bullets = 0
	Persistants.parasites = 0
	EventBus.level_complete.connect(_on_level_complete)


func _process(delta: float) -> void:
	time += delta


func _on_level_complete() -> void:
	SceneChanger.change_scene("res://levels/level_complete.tscn")
	var end_time: Dictionary = Time.get_time_dict_from_system()
	
	Persistants.level_time_min = int(time / 60)
	Persistants.level_time_sec = int(time) % 60
