class_name HintBox

extends PanelContainer

func _ready() -> void:
	EventBus.show_instruction.connect(show_hint)
	EventBus.hide_instruction.connect(hide_hint)


func show_hint(text: String) -> void:
	$Panel/Label.set_text(text)
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color.WHITE, 0.25)

func hide_hint() -> void:
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color.TRANSPARENT, 0.25)

