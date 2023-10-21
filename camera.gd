extends CharacterBody2D


const SPEED = 300.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
#	var zoomIn = false
#	var zoomOut = false

#	var zoom = get_node("Camera2D").zoom
#
#	if Input.is_action_just_released("Zoom_UP") and zoom > ZOOM_MIN:
#		zoomIn = true
#		zoomOut = false
#		print("Zoom_UP")
#	if Input.is_action_just_released("Zoom_DOWN") and zoom < ZOOM_MAX:
#		zoomOut = true
#		zoomIn = false
#		print("Zoom_DOWN")
#	if zoomIn == true:
#		zoom = lerp(zoom, zoom-Vector2(0.1, 0.1), ZOOM_SPEED)
#		await(get_tree().create_timer(0.10))
#		zoomIn = false
#		print(zoom)
#	if zoomOut == true:
#		zoom = lerp(zoom, zoom+Vector2(0.1, 0.1), ZOOM_SPEED)
#		await(get_tree().create_timer(0.10))
#		zoomOut = false
#		print(zoom)


	var upAndDown = Input.get_axis("ui_up", "ui_down")
	if upAndDown:
		velocity.y = upAndDown * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
