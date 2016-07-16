import Socket

class EchoClient {
    let port: Int32
    let host: String
    let socket: Socket

    init(host: String, port: Int32) throws {
        self.host = host
        self.port = port
        self.socket = try Socket.create()
    }

    func connect(handler: (socket: Socket) -> Void) throws {
        try socket.connect(to: host, port: port)
        handler(socket: socket)
    }
}
