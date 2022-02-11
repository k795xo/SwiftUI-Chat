//
//  ChatManager.swift
//  SwiftUI Chat
//
//  Created by Konstantin Chizhov on 11.02.2022.
//  Copyright © 2022 AntiChat, Inc. All rights reserved.
//

import Foundation

class ChatManager: ObservableObject {
    @Published var messages = [
        ChatMessage(uuid: UUID(), message: "Hello world", avatar: "A", color: "Red"),
        ChatMessage(uuid: UUID(), message: "Hi", avatar: "B", color: "Blue")
    ]
    
    func load () {
        // Subscribe to source of messages
    }
    
    func sendMessage(_ chatMessage: ChatMessage) {
        messages.append(chatMessage)
    }
}
