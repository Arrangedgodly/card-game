extends RigidBody2D

var dragging := false
var drag_offset: Vector2

func _ready():
	input_pickable = true # Enables mouse input on this node

func _input_event(_viewport, event: InputEvent, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				# Start dragging
				dragging = true
				# Calculate offset between mouse and card position
				drag_offset = global_position - get_global_mouse_position()
				# Disable physics while dragging
				freeze = true
			else:
				# Stop dragging
				dragging = false
				# Re-enable physics
				freeze = false

func _physics_process(_delta):
	if dragging:
		# Update position to follow mouse
		global_position = get_global_mouse_position() + drag_offset
