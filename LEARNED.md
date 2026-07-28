
# Navigation without removing the previous scene
La transicion de interfaces se realiza ocultando y mostrando la que se requiera, no afecta el rendimiento porque se deja limpiando de nodos la escena Game que es la que mas podria abarcar, pero en general en este caso son solo dos escenas que no son tan pesadas para tener instanciadas.
![[MasterScene.png]]
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


# Select Pairs
Aprendi a administrar los pares con el uso de seniales para saber cuando seleccionas un MemoryTile por cada seleccion con un maximo de 2 a la vez se verificara que si es un par entc se eliminan los tiles y sino pues se vuelven a dar la vuelta y puedes volver a seleccionar otro par.

![[PairSelectedPrevToDisappear.png|306]]

![[PairSelectedPostDisappear.png|298]]

![[GameOverShowedAfterEndWithPairs.png|297]]
# Sound Controller
Una manera centralizada de controlar los sonidos es la escena SoundController que intanciada en la escena Master que contiene las demas escenas, puede ejecutar todas las musicas y efecto de sonido que se le desee configurar gracias al uso de las seniales previamente creadas.

![[SoundController.png]]