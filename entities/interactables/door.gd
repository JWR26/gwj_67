extends Node3D

var is_open: bool = false


func _ready() -> void:
	EventBus.interacable_collected.connect(_on_interactable_collected)


func _on_interactable_collected(type: Interactable.TYPE) -> void:
	# player does need to know the key is collected. The door contains this information
	if type == Interactable.TYPE.KEY:
		is_open = true
		$BlastDoor.open()
		
		var tween: Tween = get_tree().create_tween()
		tween.set_parallel(true)
		
		for l in $Lights.get_children():
			tween.tween_property(l, "light_color", Color.LAWN_GREEN, 0.5)


func _on_area_3d_body_entered(body: Node3D) -> void:
	if not body is Player:
		return
	
	if not is_open:
		return
	
	$Camera3D.set_current(true)
	
	body as Player
	body.exit_level($Marker3D.get_global_position())

