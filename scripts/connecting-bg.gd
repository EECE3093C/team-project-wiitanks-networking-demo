extends ColorRect

const HOST_CONNECT_TEXT = "Waiting for Players..."
const CLIENT_CONNECT_TEXT = "Connecting to Server..."
onready var loading_text = get_node("connecting-text")

func set_connect_type(asHost):
	show()
	if asHost:
		loading_text.text = HOST_CONNECT_TEXT
	else:
		loading_text.text = CLIENT_CONNECT_TEXT
