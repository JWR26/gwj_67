extends CanvasLayer

const LEVEL: Array[String] = [
	"res://levels/level_0.tscn",
	"res://levels/level_1.tscn",
	"res://levels/end_game.tscn",
]

func _ready() -> void:
	$ColorRect.color = Color.TRANSPARENT


func change_scene(scene_file: String) -> void:
	$AnimationPlayer.play("fade")
	
	await $AnimationPlayer.animation_finished
	
	get_tree().change_scene_to_file(scene_file)
	
	$AnimationPlayer.play_backwards("fade")

