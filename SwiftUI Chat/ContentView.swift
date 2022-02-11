//
//  ContentView.swift
//  SwiftUI Chat
//
//  Created by Nick Halavins on 6/7/19. Updated 10/11/19
//  Copyright © 2019 AntiLand. All rights reserved.
//

import SwiftUI


struct ContentView : View {
    @ObservedObject var chatManager = ChatManager()
    @ObservedObject var settingsManager = SettingsManager()
    
    var body: some View {
        NavigationView {
            ChatScreen()
                .navigationBarItems(
                    trailing: NavigationLink("Settings", destination: {
                        SettingsScreen()
                    })
                )
        }
        .onAppear {
            chatManager.load()
            settingsManager.load()
        }
        .environmentObject(chatManager)
        .environmentObject(settingsManager)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
