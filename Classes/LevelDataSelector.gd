class_name LevelDataSelector

func get_images_for_level(levelSetting: LevelSetting) -> Array[Texture2D]:
	ImageManager.shuffle_tile_images()
	var selected_images: Array[Texture2D] = []
	for i in range(levelSetting.total_pairs):
		selected_images.append(ImageManager.get_image_at_index(i))
		selected_images.append(ImageManager.get_image_at_index(i))
	selected_images.shuffle()
	return selected_images
