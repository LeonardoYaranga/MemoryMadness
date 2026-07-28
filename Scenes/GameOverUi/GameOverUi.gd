extends PanelContainer

@onready var moves_label: Label = $VB/MovesLabel

func _ready() -> void:
	SignalHub.on_game_over.connect(on_game_over)
	
func on_game_over(moves_taken: int) -> void:
	moves_label.text = "You made %d moves, great job!" % [moves_taken]
	show()
