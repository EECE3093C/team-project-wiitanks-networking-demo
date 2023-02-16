extends Node

# remote procedure protocol port
const RPC_PORT = 31400
# players in the game
const MAX_PLAYERS = 2
# ip address to connect to
const TESTING_IP = "127.0.0.1" #loopback address 
const OFFLINE_TESTING = false

# each player has unique, identifiable network id
var network_id = null
var is_host = false
var peer_ids = []

# create a new server with this computer as the server.
func initialize_server():
	is_host = true
	var peer = NetworkedMultiplayerENet.new();
	peer.create_server(RPC_PORT, MAX_PLAYERS)
	get_tree().network_peer = peer

# create a new client. peers connect across this host's private ip address
func initialize_client(server_ip):
	if OFFLINE_TESTING:
		server_ip = TESTING_IP
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(server_ip, RPC_PORT)
	get_tree().network_peer = peer

# store network ids of this and all other game instances on local network.
# run this only after all other instances you want to find are on the network
func set_ids():
	network_id = get_tree().get_network_unique_id()
	peer_ids = get_tree	().get_network_unique_peers()
