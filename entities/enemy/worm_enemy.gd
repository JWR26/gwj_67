extends Enemy


func _ready() -> void:
	model.play_animation(CrabModel.ANIMATION.WALK)
	super._ready()

func attack() -> void:
	model.play_animation(CrabModel.ANIMATION.ATTACK)
	super.attack()

func _on_died() -> void:
	model.play_animation(CrabModel.ANIMATION.IDLE)
	super._on_died()

