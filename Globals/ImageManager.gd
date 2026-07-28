extends Node

const TILE_IMAGES = preload("uid://75dw3m6oh252")
const FRAME_IMAGES: Array[Texture2D] = [
 preload("uid://xku535x6lyse"),
 preload("uid://bd41objtmfeaq"),
 preload("uid://gi84o5w5wm0m"),
 preload("uid://c3w7yuxoy4p32")
]

func get_random_frame() -> Texture2D:
	return FRAME_IMAGES.pick_random()

func shuffle_tile_images() -> void:
	TILE_IMAGES.tile_images.shuffle()

func get_image_at_index(index: int) -> Texture2D:
	if index < 0 or index >= TILE_IMAGES.tile_images.size():
		push_error("Index out of bounds: " + str(index))
		return null
	return TILE_IMAGES.tile_images[index]

func get_random_image() -> Texture2D:
	return TILE_IMAGES.tile_images.pick_random()
