extends Control

func _ready() -> void:
	Persistants.level = 0

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("move"):
		SceneChanger.change_scene(SceneChanger.LEVEL[0])
