//
//  ChatRowView.swift
//  SwiftUI Chat
//
//  Created by Konstantin Chizhov on 11.02.2022.
//  Copyright © 2022 AntiChat, Inc. All rights reserved.
//

import SwiftUI

// ChatRow will be a view similar to a Cell in standard Swift
struct ChatRowView : View {
    let isMe: Bool
    // we will need to access and represent the chatMessages here
    var chatMessage: ChatMessage
    // body - is the body of the view, just like the body of the first view we created when opened the project
    var body: some View {
        // HStack - is a horizontal stack. We let the SwiftUI know that we need to place
        // all the following contents horizontally one after another
        Group {
            if !isMe {
                HStack {
                    Group {
                        Text(chatMessage.avatar)
                            .fontWeight(.bold)
                            .padding()
                            .background(
                                Circle()
                                    .fill(Color.gray)
                            )
                        Text(chatMessage.message)
                            .bold()
                            .padding(10)
                            .foregroundColor(Color.white)
                            .background(Color(chatMessage.color))
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            } else {
                HStack {
                    Group {
                        Spacer()
                        Text(chatMessage.message)
                            .bold()
                            .foregroundColor(Color.white)
                            .padding(10)
                            .background(Color(chatMessage.color))
                            .cornerRadius(10)
                        Text(chatMessage.avatar)
                            .fontWeight(.bold)
                            .padding()
                            .background(
                                Circle()
                                    .fill(Color.gray)
                            )
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        
    }
}

#if DEBUG
struct ChatRowView_Previews : PreviewProvider {
    static var previews: some View {
        ChatRowView(isMe: false, chatMessage: ChatMessage(uuid: UUID(), message: "Message", avatar: "A", color: "Green"))
        ChatRowView(isMe: true, chatMessage: ChatMessage(uuid: UUID(), message: "Message", avatar: "B", color: "Red"))
    }
}
#endif
