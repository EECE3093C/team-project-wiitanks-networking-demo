extends Button

signal set_connect_type

# references to nodes in scene
onready var ip_enter_field = get_node("ip-enter-field") # going up is bad don't be like me
onready var invalid_ip_warn = get_node("invalid-ip-warn")

func _ready():
	invalid_ip_warn.hide()

# wire to join button's on-pressed callback. When run, 
# checks if the contents of the ip input box are a valid address.
# if so, run join method. Otherwise show the invalid ip text.
func join():
	var ip_storage = ip_enter_field.text
	if ip_storage.is_valid_ip_address():
		invalid_ip_warn.text = "Valid IP, connecting..."
		invalid_ip_warn.show()
		client_connect()
	else:
		invalid_ip_warn.show()

# initialize a client with an ip equal to what's in the input box.
# signal connecting screen to show, with specialized text.
func client_connect():
	Network.initialize_client(ip_enter_field.text)
	emit_signal("set_connect_type", false)
