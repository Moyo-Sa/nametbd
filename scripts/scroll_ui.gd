extends CanvasLayer


@onready var icons := {
	"ThunderScroll": $HBoxContainer/ThunderScroll,
	"FireScroll": $HBoxContainer/FireScroll,
	"WaterScroll": $HBoxContainer/WaterScroll,
	"EarthScroll": $HBoxContainer/EarthScroll
}

func _ready():
	add_to_group("scroll_hud")
	update_scrolls()

func update_scrolls():
	for name in icons.keys():
		if GameManager.collected_scrolls.has(name):
			icons[name].modulate = Color.WHITE
		else:
			icons[name].modulate = Color(1, 1, 1, 0.25)
