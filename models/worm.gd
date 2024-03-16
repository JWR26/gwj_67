class_name WormModel

extends Node3D

enum ANIMATION{
	IDLE,
	WALK,
	ATTACK,
}

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	play_animation(ANIMATION.IDLE)


func play_animation(anim: ANIMATION) -> void:
	match anim:
		ANIMATION.IDLE:
			animation_player.play("maggot_idle")
		ANIMATION.WALK:
			animation_player.play("maggot_walk")
		ANIMATION.ATTACK:
			animation_player.play("maggot_attack")


func is_animation_playing() -> bool:
	return animation_player.is_playing()

