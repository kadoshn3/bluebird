//
//  ContentView.swift
//  ski-mountain-review
//
//  Created by Neeve Kadosh on 6/13/24.
//

import SwiftUI
import UIKit
import SocketIO

struct ContentView: View
{
    @StateObject private var socket_manager = SocketManagerWrapper()
    
    var body: some View
    {
        VStack
        {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button(action: {
                socket_manager.SendMessage(message: "[Swift] Hello server, I am user.")
            }) {
                Text("[Swift] Send Message")
            }.onAppear
            {
                socket_manager.connect()
            }
        }
        .padding()
    }
}

class SocketManagerWrapper: ObservableObject
{
    private var manager:  SocketManager
    private var socket: SocketIOClient
    
    init()
    {
        self.manager = SocketManager(socketURL: URL(string:"http://localhost:3000")!, config:[.log(true), .compress])
        self.socket = manager.defaultSocket
        SetupHandlers()
    }
    
    func connect()
    {
        socket.connect()
    }
    
    func SendMessage(message: String)
    {
        socket.emit("message", message)
    }
    
    private func SetupHandlers()
    {
        socket.on(clientEvent: .connect)
        {
            data, ack in
                print("[Swift] Socket connected")
        }
        
        socket.on("message")
        {
            (dataArray, ack) in
            if let message = dataArray[0] as? String
            {
                print("[Swift] Message received: \(message)")
            }
        }
        
        socket.on(clientEvent: .disconnect)
        {
            data, ack in
            print("[Swift] Socket disconnected")
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View {
        ContentView()
    }
}
