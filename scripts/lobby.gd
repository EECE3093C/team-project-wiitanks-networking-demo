extends Control

func _ready():
	get_tree().connect("connected_to_server", self, "connect_callback")
	
func connect_callback():
	if not Network.is_host:
		rpc("begin_game")
		begin_game()

remote func begin_game():
	get_tree().change_scene("res://scenes/Game.tscn")
