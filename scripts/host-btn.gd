extends Button

signal set_connect_type

# Called when the node enters the scene tree for the first time.
# Find the text box for host ip, fill it with host's ip address
func _ready():
	var host_ip = get_node("host-ip-label")
	host_ip.text = "IP: " + str(IP.get_local_addresses()[7])

# wire this to run when button's clicked. 
# uses network.gd to make a server, then emit a signal to turn on load screen
func host():
	Network.initialize_server()
	emit_signal("set_connect_type", true)
