//
// Created by nguquen on 16/07/2016.
//

import Foundation
import Socket

let port: Int32 = 1337

if Process.argc != 2 {
    print("usage: EchoClient <ip>")
    exit(1)
}

let client = try EchoClient(host: Process.arguments[1], port: port)
try client.connect() {(socket: Socket) in
    do {
        while true {
            let input = readLine(strippingNewline: false)
            try socket.write(from: input!)
            let readData = NSMutableData()
            let bytesRead = try socket.read(into: readData)
            if bytesRead == 0 {break}
            guard let str = NSString(data: readData, encoding: NSUTF8StringEncoding) else {
                print("Error decoding response...")
                readData.length = 0
                break
            }
            print(str, terminator: "")
        }
    } catch {
        print("socket client error: \(error)")
    }
    socket.close()
}
