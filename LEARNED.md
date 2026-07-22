
# Resources Classes like parameters
## Resource for rows x columns of the board 
Se creó una clase llamada res://Classes/LevelSetting.gd que se encarga únicamente de permitir la asignación de las variables de filas y columnas, las cuales puede usar cualquier res://Scenes/LevelButton/LevelButton.tscn de manera específica. Esta clase LevelSetting tiene métodos para calcular distintas especificaciones del tablero. Por su parte, el res://Scenes/LevelButton/LevelButton.gd muestra en su Label el contenido de filas y columnas, además de emitir una señal al ser presionado hacia el res://Scenes/Master/Master.tscn, el cual necesitará saber cierta información del tablero para crearlo y mostrarlo.
![[LevelButton.png]]

## Resources for loading images (cargar imágenes)
Las rutas de las imágenes pueden dar problemas al exportarse el juego en Godot si las llamamos solo como texto (strings). Por lo tanto, ha sido mejor trabajarlas como un recurso. Por eso se creó la clase res://Classes/TileImagesHolder.gd, de la cual se crea un objeto/recurso res://Resources/TileImages.tres, y a este se le pueden agregar visualmente en el inspector todas las imágenes con las que vamos a trabajar. ![[TileImages.tres.png]]

# Tweens
Usamos Tweens para animar propiedades desde el código de forma dinámica (por ejemplo, usando valores aleatorios o cuando no está definido exactamente cuándo terminará). Se usan mucho cuando se quiere dar continuidad de forma fluida, ya que, mientras que un nodo AnimationPlayer a veces resetea los valores al inicio de su animación, los Tweens permiten que la animación continúe exactamente a partir del punto o valor actual en el que se quedó el objeto.

En este caso se emplearon para animar los FrontSprite y que mantengan un movimiento perpetuo y fluido de escalamiento y rotación, llamando recursivamente a la función con un callback para generar nuevos valores aleatorios en cada ciclo.
![[FrontSprites1.png|479]]

![[FrontSprites2.png|498]]