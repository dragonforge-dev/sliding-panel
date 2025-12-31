class_name SlidingPanel extends PanelContainer

signal closing

@export var action_name: String
@export var open_time: float = 0.6
@export var close_time: float = 0.5
@export var parent_panel: SlidingPanel

var tween: Tween

var starting_position: Vector2

func _ready() -> void:
	starting_position = position
	if visible == false:
		position.y = -size.y
	if parent_panel:
		parent_panel.closing.connect(close)


func _input(event: InputEvent) -> void:
	if action_name and event.is_action_pressed(action_name):
		if visible:
			close()
		else:
			open()


func open() -> void:
	show()
	tween = create_tween()
	tween.tween_property(self, "position:y", starting_position.y, open_time).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)


func close() -> void:
	closing.emit()
	tween = create_tween()
	tween.tween_property(self, "position:y", -size.y, close_time).set_ease(Tween.EASE_IN)
	await get_tree().create_timer(close_time).timeout
	hide()
