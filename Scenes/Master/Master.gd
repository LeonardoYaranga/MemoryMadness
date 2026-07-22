extends Control
@onready var game: Control = $Game
@onready var main: Control = $Main


func _ready() -> void:
	SignalHub.on_level_selected.connect(on_level_selected)
	SignalHub.on_exit_button_pressed.connect(on_exit_button_pressed)
	show_main(true)

func show_game(s: bool) -> void:
	game.visible = s
	main.visible = not s

func show_main(s: bool) -> void:
	main.visible = s
	game.visible = not s

func on_level_selected(level_setting: LevelSetting) -> void:
	show_game(true)

func on_exit_button_pressed() -> void:
	show_main(true)
