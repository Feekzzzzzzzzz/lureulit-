extends KinematicBody2D

var being_dragged = false
export var speed = 10
var is_caught = false
signal fish_removed

const FLOAT_TOLERANCE = 0.01  # Allow for a small tolerance in the Y position

func _process(delta):
	# Move the fish only if it's not being dragged or caught
	if not being_dragged and not is_caught:
		self.position.x += speed * delta
	# Follow the hook if the fish is being dragged
	elif being_dragged:
		var hook_position = get_node("../Players/Hook").global_position
		self.global_position = hook_position
		print (self.global_position.y)
		# Check if the fish should be removed based on Y position (with tolerance)
		if abs(self.global_position.y - 178.671692) < FLOAT_TOLERANCE:
			self.queue_free()  # Remove the fish from the scene
			emit_signal("fish_removed")  # Notify the main node that the fish is gone

# Function to catch the fish
func catch_fish():
	if not is_caught:
		is_caught = true  # Mark the fish as caught
		being_dragged = true  # Start dragging the fish

# Add the fish to the 'Fish' group when it enters the scene
func _ready():
	add_to_group("Fish")
