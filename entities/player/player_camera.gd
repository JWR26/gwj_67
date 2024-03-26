class_name PlayerCamera

extends Camera3D

const FOV_FAR: float = 62.5
const FOV_NEAR: float = 37.5
const POSITION: Vector3 = Vector3(4, 10, 4)
const OFFSET: float = 0.1
const MAX_OFFSET: float = 1.8
const RAY_LENGTH: int = 1000 #arbritrary ray length

var is_close: bool = false

func _ready() -> void:
	position = POSITION
	fov = FOV_FAR


func ray_query() -> Dictionary:
	var pos: Vector2 = get_viewport().get_mouse_position()
	var space: PhysicsDirectSpaceState3D = get_world_3d().direct_space_state
	var query: PhysicsRayQueryParameters3D = PhysicsRayQueryParameters3D.new()
	
	query.from = project_ray_origin(pos)
	query.to = query.from + project_ray_normal(pos) * RAY_LENGTH
	
	#print(space.intersect_ray(query))
	return space.intersect_ray(query)


func mouse_position_3D(default: Vector3) -> Vector3:
	var result: Dictionary = ray_query()
	
	if not result:
		return default
	
	return result["position"]


func mouse_object() -> Object:
	var result: Dictionary = ray_query()
	
	return result["collider"] if result else null


func move_close() -> void:
	is_close = true
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(self, "fov", FOV_NEAR, 1.5).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)


func move_far() -> void:
	is_close = false
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(self, "fov", FOV_FAR, 1.5).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)


#func offset(dir: Vector3) -> void:
	# does not yeild desired result for the moment
	#if is_close:
		#position.x = clamp(position.x + dir.x * OFFSET, POSITION.x - MAX_OFFSET, POSITION.x + MAX_OFFSET)
		#position.z = clamp(position.z + dir.z * OFFSET, POSITION.z - MAX_OFFSET, POSITION.z + MAX_OFFSET)
	#
	#else:
		#position = POSITION
