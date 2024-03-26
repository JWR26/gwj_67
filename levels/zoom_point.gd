extends Node3D


func _on_zoom_out_body_entered(body: Node3D) -> void:
	if not body is Player:
		return
	
	body as Player
	body.zoom_out()


func _on_zoom_in_body_entered(body: Node3D) -> void:
	if not body is Player:
		return
	
	body as Player
	body.zoom_in()
