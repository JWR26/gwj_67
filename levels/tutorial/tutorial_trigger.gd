class_name TutorialTrigger

extends Area3D

var show_pos: Vector2 = Vector2(64, 0)
var hide_pos: Vector2 = Vector2(-192, 0)

@onready var instruction: Label = $CanvasLayer/Label
@export_multiline var text: String = "[insert tutorial text here]"

func _ready() -> void:
	instruction.modulate = Color.TRANSPARENT
	
	instruction.set_text(text)
	
	body_entered.connect(show_instruction)
	body_exited.connect(hide_instruction)


func show_instruction(body: Node3D) -> void:
	if not body is Player:
		return
	
	var tween: Tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property(instruction, "position", show_pos, 0.5)
	tween.tween_property(instruction, "modulate", Color.WHITE, 0.3)
	
	tween.set_ease(Tween.EASE_OUT)
	

func hide_instruction(body: Node3D) -> void:
	if not body is Player:
		return
	
	var tween: Tween = get_tree().create_tween()
	tween.set_parallel(true)
	
	tween.tween_property(instruction, "position", hide_pos, 0.5)
	tween.tween_property(instruction, "modulate", Color.TRANSPARENT, 0.3)
	
	tween.set_ease(Tween.EASE_OUT)
	
