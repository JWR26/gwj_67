class_name TutorialTrigger

extends Area3D

var has_triggered: bool = false

@export_multiline var text: String = "[insert tutorial text here]"

func _ready() -> void:
	body_entered.connect(show_instruction)
	body_exited.connect(hide_instruction)


func show_instruction(body: Node3D) -> void:
	if not body is Player:
		return
	
	if has_triggered:
		return
	
	EventBus.show_instruction.emit(text)

func hide_instruction(body: Node3D) -> void:
	if not body is Player:
		return
	
	if has_triggered:
		return
	
	has_triggered = true
	
	EventBus.hide_instruction.emit()
