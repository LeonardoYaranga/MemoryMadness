extends Node

signal on_level_selected(level_setting: LevelSetting)
signal on_exit_button_pressed()
signal on_memory_tile_selected(tile: MemoryTile)
signal on_pairs_made()
signal on_two_tiles_selected()
signal on_game_over(moves_taken: int)

func emit_on_level_selected(level_setting: LevelSetting) -> void:
	on_level_selected.emit(level_setting)

func emit_on_exit_button_pressed() -> void:
	on_exit_button_pressed.emit()

func emit_on_memory_tile_selected(tile: MemoryTile) -> void:
	on_memory_tile_selected.emit(tile)

func emit_on_pairs_made() -> void:
	on_pairs_made.emit()

func emit_on_two_tiles_selected() -> void:
	on_two_tiles_selected.emit()

func emit_on_game_over(moves_taken: int) -> void:
	on_game_over.emit(moves_taken)
