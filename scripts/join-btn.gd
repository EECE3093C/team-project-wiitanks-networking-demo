extends Button

signal set_connect_type

# references to nodes in scene
onready var host_ip_box = get_node("host-ip-label") 
onready var invalid_ip_warn = get_node("invalid-ip-warn")

# wire to join button's on-pressed callback. When run, 
# checks if the contents of the ip input box are a valid address.
# if so, run join method. Otherwise show the invalid ip text.
func _pressed():
	if host_ip_box.text.is_valid_ip_address():
		join()
	else:
		invalid_ip_warn.show()

# initialize a client with an ip equal to what's in the input box.
# signal connecting screen to show, with specialized text.
func join():
	Network.initialize_client(host_ip_box.text)
	emit_signal("set_connect_type", false)
