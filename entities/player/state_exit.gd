class_name PlayerStateExit

extends PlayerState

const SPEED: int = 6

var target: Vector3


func calculate_velocity(from: Vector3, to: Vector3) -> PlayerState:
	target = to
	
	player.velocity = from.direction_to(target) * SPEED
	
	return null


func orientate_model(_cursor_position) -> void:
	super.orientate_model(target)


func enter() -> void:
	model.play_animation(HumanModel.ANIMATION.RUN)
