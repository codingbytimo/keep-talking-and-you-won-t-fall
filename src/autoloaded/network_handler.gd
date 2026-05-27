extends Node

const IP_ADDRESS: String = "localhost"
const PORT: int = 42069

var peer: ENetMultiplayerPeer


func server_start() -> void:
	print("Hosting")
	
	peer = ENetMultiplayerPeer.new()
	peer.create_server(PORT)
	multiplayer.multiplayer_peer = peer
	
	multiplayer.peer_connected.connect(_add_player)

	
func client_start() -> void:
	print("Joining")
	
	peer = ENetMultiplayerPeer.new()
	peer.create_client(IP_ADDRESS,PORT)
	multiplayer.multiplayer_peer = peer

func _add_player(id: int) -> void:
	print("Player %s joined" % id)
	
