extends Button

@onready var panel_container: PanelContainer = $"../.."


func _ready() -> void:
	pressed.connect(func() -> void: panel_container.close())
