extends CharacterBody3D

@export var lane_index: int = 1
@export var lane_distance: float = 2.5
@export var lane_change_speed: float = 8.0
@export var swipe_threshold: int = 50
@export_file("*.glb,*.tscn") var model_path := "res://models/character_hull_colored.glb"
@export var model_scale: float = 1.02
@export var model_y_offset: float = 0.90151494

var touch_start := Vector2.ZERO
var touch_active := false

func _ready() -> void:
	translation.x = (lane_index - 1) * lane_distance

	var ch = get_node_or_null("CharacterModel")
	if ch:
		ch.translation = Vector3(0.0, model_y_offset, 0.0)
		ch.scale = Vector3(model_scale, model_scale, model_scale)
		return

	var res = ResourceLoader.load(model_path)
	if res and res is PackedScene:
		var inst = res.instantiate()
		inst.name = "CharacterModel"
		inst.translation = Vector3(0.0, model_y_offset, 0.0)
		inst.scale = Vector3(model_scale, model_scale, model_scale)
		add_child(inst)
		var mesh = get_node_or_null("MeshInstance3D")
		if mesh:
			mesh.hide()
	else:
		print("Character model not found at: ", model_path)

func _physics_process(delta: float) -> void:
	var desired_x = (lane_index - 1) * lane_distance
	translation.x = lerp(translation.x, desired_x, clamp(lane_change_speed * delta, 0.0, 1.0))

func _input(event) -> void:
	# Keyboard
	if event is InputEventKey and event.pressed and not event.echo:
		if event.scancode == KEY_LEFT or event.scancode == KEY_A:
			_move_left()
		elif event.scancode == KEY_RIGHT or event.scancode == KEY_D:
			_move_right()

	# Touch
	if event is InputEventScreenTouch:
		if event.pressed:
			touch_start = event.position
			touch_active = true
		else:
			if touch_active:
				var d = event.position - touch_start
				if abs(d.x) >= swipe_threshold and abs(d.x) > abs(d.y):
					if d.x > 0:
						_move_right()
					else:
						_move_left()
				touch_active = false

	# Mouse fallback
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			touch_start = event.position
			touch_active = true
		else:
			if touch_active:
				var d = get_viewport().get_mouse_position() - touch_start
				if abs(d.x) >= swipe_threshold and abs(d.x) > abs(d.y):
					if d.x > 0:
						_move_right()
					else:
						_move_left()
				touch_active = false

func _move_left() -> void:
	lane_index = max(0, lane_index - 1)

func _move_right() -> void:
	lane_index = min(2, lane_index + 1)
