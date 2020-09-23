extends AnimatedSprite




func _on_AnimatedSprite_animation_finished():# when anomation is done
	queue_free()# remove from tree
