extends Node2D

# on entering scene tree, store ids of all connected machines, create a player for each
func _ready():
	Network.set_ids()
	create_players()

# for each puppet machine ip address, create a player for them. then create one for the host.
func create_players():
	for id in Network.peer_ids:
		create_player(id)
	create_player(Network.network_id)

# initialize a new player into the scene, given the ip of the controlling machine.
func create_player(id):
	var newPlayer = preload("res://Scenes/Player.tscn").instance()
	add_child(newPlayer)
	newPlayer.initialize(id)
