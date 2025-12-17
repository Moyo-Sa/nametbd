extends AudioStreamPlayer2D

@onready var music: AudioStreamPlayer2D = $"."


func _ready():
	music.stream.loop = true  # force the stream to loop
	music.play()
