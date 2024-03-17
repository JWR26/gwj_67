extends Node

const BULLETS_DEFAULT: int = 0
const PLAYER_HP: int = 20
const INFECTION_COUNT: int = 0

var bullets: int = 0
var hp: int = 20
var parasites: int = 0

var level: int = 0
var level_time_min: int = 0
var level_time_sec: int = 0
var level_enemies: int = 0
var level_kills: int = 0

func reset() -> void:
	bullets = BULLETS_DEFAULT
	hp = PLAYER_HP
	parasites = INFECTION_COUNT
