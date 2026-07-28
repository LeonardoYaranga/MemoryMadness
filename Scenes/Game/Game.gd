class_name Game

extends Control
const MEMORY_TILE = preload("uid://cql5xay1b52lu")
@onready var grid_container: GridContainer = $HB/GridContainer
@onready var scorer: Scorer = $Scorer
@onready var pairs_number_label: Label = $HB/VB/HB2/PairsNumberLabel
@onready var moves_number_label: Label = $HB/VB/HB/MovesNumberLabel
@onready var game_over_ui: PanelContainer = $MarginContainer/GameOverUi

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_level_selected.connect(on_level_selected)
	SignalHub.on_pairs_made.connect(on_pairs_made)
	SignalHub.on_two_tiles_selected.connect(on_two_tiles_selected)

	
func on_pairs_made() -> void:
	pairs_number_label.text = scorer.get_pairs_info_str()

func on_two_tiles_selected() -> void:
	moves_number_label.text = scorer.get_moves_info_str()
	
func on_level_selected(level_setting: LevelSetting) -> void:
	var lds : LevelDataSelector = LevelDataSelector.new()
	var selected_images: Array[Texture2D] = lds.get_images_for_level(level_setting)
	var frame_image: Texture2D = ImageManager.get_random_frame()
	grid_container.columns = level_setting.columns
	#instantiate MEMORY_TILE and add to grid_container the number of collumnxrows of level_setting
	for image in selected_images:
		var tile: MemoryTile = MEMORY_TILE.instantiate()
		grid_container.add_child(tile)
		tile.setup(image, frame_image)
	scorer.clear_for_new_game(level_setting.total_pairs)
	pairs_number_label.text = "0 / %d " % level_setting.total_pairs
	
func _on_exit_button_pressed() -> void:
	for i in grid_container.get_children():
		i.queue_free()
	game_over_ui.hide()
	SignalHub.emit_on_exit_button_pressed()
