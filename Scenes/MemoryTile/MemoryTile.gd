class_name MemoryTile

extends TextureButton

@onready var frame_image: TextureRect = $FrameImage
@onready var tile_image: TextureRect = $TileImage

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reveal(false)

func setup(image: Texture2D, frame: Texture2D) -> void:
	tile_image.texture = image
	frame_image.texture = frame
	
func matches_other_tile(tile: MemoryTile) -> bool:
	return tile != self and tile.tile_image.texture == tile_image.texture
	
func kill_on_pair() -> void:
	z_index = 10
	disabled = true
	var tween: Tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "rotation_degrees", 720, 0.6)
	tween.tween_property(self, "scale", Vector2(1.5, 1.5), 0.6)
	tween.tween_interval(0.5)
	tween.tween_property(self, "modulate", Color.TRANSPARENT, 0.5)


func reveal(v: bool) -> void:
	tile_image.visible = v
	frame_image.visible = v
	
func _on_pressed() -> void:
	if !Scorer.SelectionEnabled: return
	reveal(true)
	SignalHub.emit_on_memory_tile_selected(self)
