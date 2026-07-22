class_name LevelSetting

extends Resource

@export var rows: int = 0
@export var columns: int = 0

var total_tiles: int = 0:
	get: return rows * columns

var total_pairs: int = 0:
	get: return total_tiles / 2

func _to_string() -> String:
	return "%dx%d" % [rows, columns]
