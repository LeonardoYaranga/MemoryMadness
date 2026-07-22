extends Node

const TILE_IMAGES = preload("uid://75dw3m6oh252")

func get_random_image() -> Texture2D:
   return TILE_IMAGES.tile_images.pick_random()
