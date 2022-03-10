//
//  ChatScreen.swift
//  SwiftUI Chat
//
//  Created by Konstantin Chizhov on 11.02.2022.
//  Copyright © 2022 AntiChat, Inc. All rights reserved.
//

import SwiftUI

struct ChatScreen: View {
    
    // @State here is necessary to make the composedMessage variable accessible from different views
    @State var composedMessage: String = ""
    @EnvironmentObject var chatManager: ChatManager
    @EnvironmentObject var settingsManager: SettingsManager
    
    var body: some View {
        // the VStack is a vertical stack where we place all our substacks like the List and the TextField
        VStack {
            // I've removed the text line from here and replaced it with a list
            // List is the way you should create any list in SwiftUI
            ScrollView {
                // we have several messages so we use the For Loop
                ForEach(chatManager.messages, id: \.self) { msg in
                    ChatRowView(isMe: msg.uuid == settingsManager.userId, chatMessage: msg)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            
            // TextField are aligned with the Send Button in the same line so we put them in HStack
            HStack {
                // this textField generates the value for the composedMessage @State var
                TextField("Message...", text: $composedMessage).frame(minHeight: CGFloat(30))
                // the button triggers the sendMessage() function written in the end of current View
                Button(action: sendMessage) {
                    Text("Send")
                }
            }.frame(minHeight: CGFloat(50)).padding()
            // that's the height of the HStack
        }
    }
    
    func sendMessage() {
        chatManager.sendMessage(ChatMessage(uuid: settingsManager.userId, message: composedMessage, avatar: settingsManager.avatar, color: settingsManager.color))
        composedMessage = ""
    }
}

struct ChatScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChatScreen()
            .environmentObject(ChatManager())
            .environmentObject(SettingsManager())
    }
}
