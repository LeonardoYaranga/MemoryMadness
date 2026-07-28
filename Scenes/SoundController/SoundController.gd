extends Node

@export var main_menu_music: AudioStream
@export var game_music: AudioStream
@export var click_effect: AudioStream
@export var tile_effect: AudioStream
@export var game_over_effect: AudioStream
@export var pairs_made_effect: AudioStream

@onready var music: AudioStreamPlayer = $Music
@onready var effects: AudioStreamPlayer = $Effects

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_level_selected.connect(on_level_selected)
	SignalHub.on_memory_tile_selected.connect(on_memory_tile_selected)
	SignalHub.on_exit_button_pressed.connect(on_exit_button_pressed)
	SignalHub.on_game_over.connect(on_game_over)
	SignalHub.on_pairs_made.connect(on_pairs_made)
	on_exit_button_pressed()

func play_music(music_stream: AudioStream) -> void:
	music.stream = music_stream
	music.play()

func play_effect(effect_stream: AudioStream) -> void:
	effects.stream = effect_stream
	effects.play()

func on_level_selected(level_setting: LevelSetting) -> void:
	play_music(game_music)
	play_effect(click_effect)
	
func on_memory_tile_selected(tile: MemoryTile) -> void:
	play_effect(tile_effect)
	
func on_exit_button_pressed() -> void:
	play_music(main_menu_music)
	play_effect(click_effect)
	
func on_game_over(moves_taken: int) -> void:
	play_effect(game_over_effect)
	
func on_pairs_made() -> void:
	play_effect(pairs_made_effect)
