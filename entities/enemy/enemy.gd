class_name Enemy

extends CharacterBody3D

var attacking: bool = false
var is_dead: bool = false

@onready var health_component: HealthComponent = $HealthComponent
@onready var nav_agent: NavigationAgent3D = $NavigationAgent3D

@export var attack_range: float = 1.0
@export var player: CharacterBody3D
@export var speed: int = 0
@export var model: Node3D

func _ready() -> void:
	set_physics_process(false)
	health_component.died.connect(_on_died)
	Persistants.level_enemies += 1


func _physics_process(_delta: float) -> void:
	if is_dead or attacking:
		return
	
	if global_position.distance_to(player.global_position) < attack_range:
		attack()
		return
	
	# Pathfinding
	nav_agent.set_target_position(player.global_transform.origin)
	var next_nav_point = nav_agent.get_next_path_position() 
	
	velocity = global_position.direction_to(next_nav_point) * speed
	
	model.look_at(next_nav_point)
	model.rotate_y(PI) #the sprite is facing backwards
	
	move_and_slide()


func attack() -> void:
	var timer: SceneTreeTimer = get_tree().create_timer(0.2)
	await timer.timeout
	var tween: Tween = get_tree().create_tween()
	
	tween.set_parallel()
	tween.tween_property(model, "global_position", player.get_infest_point(), 0.25)
	tween.tween_property(model, "scale", Vector3.ZERO, 0.25)
	
	tween.set_ease(tween.EASE_OUT)
	
	await tween.finished
	
	player.infest()
	
	queue_free()


func take_damage(value: int) -> void:
	$Shot.play()
	$HealthComponent.take_damage(value)


func _on_died() -> void:
	Persistants.level_kills += 1
	is_dead = true
	
	var tween: Tween = get_tree().create_tween()
	
	tween.tween_property(model, "scale", Vector3.ZERO, 0.25)
	
	tween.set_ease(tween.EASE_OUT)
	
	await tween.finished
	
	queue_free()


func _on_visible_on_screen_notifier_3d_screen_entered() -> void:
	set_physics_process(true)
