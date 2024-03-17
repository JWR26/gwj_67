extends Control


@onready var time_label: Label = $VBoxContainer/HBC/TimeTaken
@onready var kill_label: Label = $VBoxContainer/HBC2/KillPercent

func _ready() -> void:
	Persistants.level += 1
	display_stats()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("move"):
		SceneChanger.change_scene(SceneChanger.LEVEL[Persistants.level])


func display_stats() -> void:
	var time_string: String = "{0}  MIN   {1}  SECONDS ".format([Persistants.level_time_min, Persistants.level_time_sec])
	time_label.set_text(time_string)
	var kills_string: String = "{0} / {1}".format([Persistants.level_kills, Persistants.level_enemies])
	kill_label.set_text(kills_string)
