//
//  ChatMessage.swift
//  SwiftUI Chat
//
//  Created by Konstantin Chizhov on 11.02.2022.
//  Copyright © 2022 AntiChat, Inc. All rights reserved.
//

import SwiftUI

// let's create a structure that will represent each message in chat
struct ChatMessage : Hashable {
    var uuid: UUID
    var message: String
    var avatar: String
    var color: String
}
