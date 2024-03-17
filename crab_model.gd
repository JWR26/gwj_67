class_name CrabModel

extends Node3D

enum ANIMATION{
	IDLE,
	WALK,
	ATTACK,
	DIE
}

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	play_animation(ANIMATION.IDLE)


func play_animation(anim: ANIMATION) -> void:
	match anim:
		ANIMATION.IDLE:
			animation_player.play("crab_idle")
		ANIMATION.WALK:
			animation_player.play("crab_walk")
		ANIMATION.ATTACK:
			animation_player.play("crab_attack_right")
		ANIMATION.DIE:
			animation_player.play("crab_die")


func is_animation_playing() -> bool:
	return animation_player.is_playing()

