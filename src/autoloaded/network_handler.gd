extends Node

var ip_address: String = "localhost"
var port: int = 42069

var peer: ENetMultiplayerPeer

signal player_joined
signal joined_to_host

func server_start() -> void:
	print("Hosting")
	
	peer = ENetMultiplayerPeer.new()
	peer.create_server(port)
	multiplayer.multiplayer_peer = peer
	
	multiplayer.peer_connected.connect(_add_player)

	
func client_start() -> void:
	print("Joining")
	
	peer = ENetMultiplayerPeer.new()
	peer.create_client(ip_address,port)
	multiplayer.multiplayer_peer = peer
	
	multiplayer.connected_to_server.connect(_connected_to_server)

func _add_player(id: int) -> void:
	print("Player %s joined" % id)
	player_joined.emit()
	
func _connected_to_server() -> void:
	print("Found Host")
	joined_to_host.emit()
