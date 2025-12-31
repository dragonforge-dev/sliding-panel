extends Button

@export var sliding_panel: SlidingPanel


func _ready() -> void:
	pressed.connect(_on_button_pressed)


func _on_button_pressed() -> void:
		if sliding_panel.visible:
			sliding_panel.close()
		else:
			sliding_panel.open()
