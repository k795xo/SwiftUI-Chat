//
//  SettingsManager.swift
//  SwiftUI Chat
//
//  Created by Konstantin Chizhov on 11.02.2022.
//  Copyright © 2022 AntiChat, Inc. All rights reserved.
//

import SwiftUI

class SettingsManager: ObservableObject {
    @Published var userId = UUID()
    
    @Published var color = "Green"
    
    @Published var avatar = "A"
    
    @Published var name: String = "Anonymous"
    
    let availableColors = [
        "Red", "Green", "Blue"
    ]
    
    func load() {
        let settings = Settings.initFromUserDefaults()
        
        userId = settings.userId
        let found = availableColors.first(where: {$0 == settings.color })
        color = found ?? "Green"
        name = settings.name
        avatar = (name.first ?? "A").uppercased()
    }
    
    func save() {
        if name.isEmpty {
            name = "Anonymous"
        }
        avatar = name.first!.uppercased()
        
        let settings = Settings(userId: userId, color: color, name: name)
        settings.saveToUserDefaults()
    }
}
