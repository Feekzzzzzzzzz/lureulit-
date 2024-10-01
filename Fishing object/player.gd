extends StaticBody2D



func _on_AnimatedSprite_animation_finished():
	if get_node("AnimatedSprite").animation == "hook":
		get_node("AnimatedSprite").play("idle")
