class_name Scorer

extends Node

static var SelectionEnabled: bool = true
@onready var reveal_timer: Timer = $RevealTimer
var _pairs_score: int = 0
var _target_pairs: int = 999
var _moves_made: int = 0

var _selected_memory_tails: Array[MemoryTile]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_memory_tile_selected.connect(on_memory_tile_selected)
	SignalHub.on_exit_button_pressed.connect(on_exit_button_pressed)

func check_for_game_over() -> void:
	if _pairs_score == _target_pairs:
		SignalHub.emit_on_game_over(_moves_made)

func check_for_pair() -> void:
	_moves_made += 1
	SignalHub.emit_on_two_tiles_selected()
	if _selected_memory_tails[0].matches_other_tile(_selected_memory_tails[1]):
		await get_tree().create_timer(0.4).timeout
		_selected_memory_tails[0].kill_on_pair()
		_selected_memory_tails[1].kill_on_pair()
		_pairs_score += 1
		SignalHub.emit_on_pairs_made()
		check_for_game_over()
		
func get_pairs_info_str() -> String:
	return "%d / %d" % [_pairs_score, _target_pairs]

func get_moves_info_str() -> String:
	return "%d" % [_moves_made]
	
func clear_for_new_game(total_pairs: int) -> void:
	reveal_timer.stop()
	_selected_memory_tails.clear()
	SelectionEnabled = true
	_pairs_score = 0
	_moves_made = 0
	_target_pairs = total_pairs
	update_pairs_and_moves_info()
	
func update_pairs_and_moves_info() -> void:
	#signals activation only for update the initial value = 0
	SignalHub.emit_on_pairs_made()
	SignalHub.emit_on_two_tiles_selected()
	
func process_pairs() -> void:
	if _selected_memory_tails.size() != 2: return
	SelectionEnabled = false
	reveal_timer.start()
	check_for_pair()
	
func on_memory_tile_selected(tile: MemoryTile) -> void:
	if !SelectionEnabled: return
	if tile in _selected_memory_tails: return
	_selected_memory_tails.append(tile)
	process_pairs()

func _on_reveal_timer_timeout() -> void:
	#hide the tiles after de timeout
	for tile in _selected_memory_tails:
		tile.reveal(false)
	SelectionEnabled = true
	_selected_memory_tails.clear()

func on_exit_button_pressed() -> void:
	reveal_timer.stop()
	_selected_memory_tails.clear()
	SelectionEnabled = true
