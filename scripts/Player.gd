extends KinematicBody2D

const SPEED = 350
# allows this player to be controlled by another game instance if false
var is_master = false

func initialize(id):
	name = str(id)
	
	# if my network id is that of the host's, note that I am the master player
	if id == Network.network_id:
		is_master = true
	else:
		# marker color for puppet players
		modulate = Color8(225, 0, 0, 225)

# called every physics tick. enables player movement standard to top-down 2d games.
func _physics_process(delta):
	
	# if I am the master player, 
	if is_master:
		var velocity = Vector2()
		# add horizontal motion to vector.
		if Input.is_action_pressed("ui_right"):
			velocity.x = SPEED
		elif Input.is_action_pressed("ui_left"):
			velocity.x = -SPEED
		else:
			velocity.x = 0
		
		# add vertical motion to vector. note this axis is inverted.
		if Input.is_action_pressed("ui_down"):
			velocity.y = SPEED
		elif Input.is_action_pressed("ui_up"):
			velocity.y = -SPEED
		else:
			velocity.y = 0
		
		# inbuilt godot movement smoothing
		move_and_slide(velocity)
		# send data to puppet players. this is fast, but packets might be dropped. calls the 
		# "update_position" function of the puppets with "position" as an argument.
		rpc_unreliable("update_position", position)

# set this player's position to inputPos
remote func update_position(inputPos):
	position = inputPos
