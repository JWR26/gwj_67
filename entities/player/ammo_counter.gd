class_name AmmoCounter

extends HBoxContainer

func _ready() -> void:
	update(0)


func update(value: int) -> void:
	$Label.set_text(str(value))
