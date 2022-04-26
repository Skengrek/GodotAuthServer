extends Node

var network = NetworkedMultiplayerENet.new()
var port = 8991
var maxServers = 5


func _ready():
	startServer()
	

func startServer():
	print('Create Auth Server')
	network.create_server(port, maxServers)
	get_tree().set_network_peer(network)
	
	network.connect('peer_connected', self, '_Peer_Connected')
	network.connect('peer_disconnected', self, '_Peer_Disconnected')


func _Peer_Connected(gateway_id):
	print(str(gateway_id) + 'Connected')


func _Peer_Disconnected(gateway_id):
	print(str(gateway_id) + 'Disconnected')
