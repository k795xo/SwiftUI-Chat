//
//  SettingsScreen.swift
//  SwiftUI Chat
//
//  Created by Konstantin Chizhov on 11.02.2022.
//  Copyright © 2022 AntiChat, Inc. All rights reserved.
//

import SwiftUI
import Combine

struct SettingsScreen: View {
    @EnvironmentObject var settingsManager: SettingsManager
    
    
    var body: some View {
        Form {
            Section(header: Text("General")) {
                TextField("Your name", text: $settingsManager.name)
                
                Picker(selection: $settingsManager.color, label: Text("Color")) {
                    ForEach(settingsManager.availableColors, id: \.self) {
                        Text($0)
                            .foregroundColor(Color($0))
                    }
                }
            }
        }
        .onDisappear {
            settingsManager.save()
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
            .environmentObject(SettingsManager())
    }
}
