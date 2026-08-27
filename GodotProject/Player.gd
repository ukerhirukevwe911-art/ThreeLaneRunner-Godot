extends KinematicBody

# Three-lane runner controller for Godot 3 (3D)
# Left swipe -> move left, Right swipe -> move right (correct mapping)
# Lanes: 0 = left, 1 = center, 2 = right

export (int) var lane_index := 1
export (float) var lane_distance := 2.5
export (float) var lane_change_speed := 8.0
export (int) var swipe_threshold := 50 # pixels

var touch_start := Vector2()
var touch_active := false

func _ready():
	# Ensure the player starts at the target lane X
	translation.x = (lane_index - 1) * lane_distance

func _physics_process(delta):
	var desired_x = (lane_index - 1) * lane_distance
	var cur_x = translation.x
	# Smoothly move toward the desired lane at a fixed rate (frame-rate independent)
	cur_x = lerp(cur_x, desired_x, clamp(lane_change_speed * delta, 0, 1))
	translation.x = cur_x

func _input(event):
	# Keyboard input (A/D or Left/Right)
	if event is InputEventKey and event.pressed and not event.echo:
		if event.scancode == KEY_LEFT or event.scancode == KEY_A:
			_move_left()
		elif event.scancode == KEY_RIGHT or event.scancode == KEY_D:
			_move_right()

	# Touch input
	if event is InputEventScreenTouch:
		if event.pressed:
			touch_start = event.position
			touch_active = true
		else:
			if touch_active:
				var delta = event.position - touch_start
				if abs(delta.x) >= swipe_threshold and abs(delta.x) > abs(delta.y):
					if delta.x > 0:
						_move_right() # swipe right -> move right
					else:
						_move_left()  # swipe left -> move left
				# reset
				touch_active = false

	# Mouse (desktop) swipe fallback
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				touch_start = event.position
				touch_active = true
			else:
				if touch_active:
					var delta_m = get_viewport().get_mouse_position() - touch_start
					if abs(delta_m.x) >= swipe_threshold and abs(delta_m.x) > abs(delta_m.y):
						if delta_m.x > 0:
							_move_right()
						else:
							_move_left()
					# reset
					touch_active = false

func _move_left():
	lane_index = max(0, lane_index - 1)

func _move_right():
	lane_index = min(2, lane_index + 1)
