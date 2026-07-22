class_name Game

extends Control
const MEMORY_TILE = preload("uid://cql5xay1b52lu")
@onready var grid_container: GridContainer = $HB/GridContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_level_selected.connect(on_level_selected)

func on_level_selected(level_setting: LevelSetting) -> void:
	grid_container.columns = level_setting.columns
	#instantiate MEMORY_TILE and add to grid_container the number of collumnxrows of level_setting
	for i in range(level_setting.total_tiles):
		var tile = MEMORY_TILE.instantiate()
		grid_container.add_child(tile)


func _on_exit_button_pressed() -> void:
	for i in grid_container.get_children():
		i.queue_free()
		
	SignalHub.emit_on_exit_button_pressed()
