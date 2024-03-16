extends MarginContainer

var worm_sprite: CompressedTexture2D = preload("res://assets/ui/worm_sprite.png")

@export var player_health_component: PlayerHealthComponent

func _ready() -> void:
	pass
	player_health_component.infested.connect(add_parasite)
	EventBus.interacable_collected.connect(_on_interactable_collected)

func add_parasite() -> void:
	var w: TextureRect = TextureRect.new()
	w.texture = worm_sprite
	$VBoxContainer.add_child(w)


func _on_interactable_collected(type: Interactable.TYPE) -> void:
	if type == Interactable.TYPE.MEDS:
		for child in $VBoxContainer.get_children():
			child.queue_free()
