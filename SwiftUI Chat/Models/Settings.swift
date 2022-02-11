//
//  Settings.swift
//  SwiftUI Chat
//
//  Created by Konstantin Chizhov on 11.02.2022.
//  Copyright © 2022 AntiChat, Inc. All rights reserved.
//

import SwiftUI

struct Settings {
    let userId: UUID
    let color: String
    let name: String
}

extension Settings: Codable {
    private static let userDefaultsKey = "Settings"
    
    static func initFromUserDefaults() -> Settings {
        if let settingsData = UserDefaults.standard.object(forKey: Settings.userDefaultsKey) as? Data,
           let settings = try? JSONDecoder().decode(Settings.self, from: settingsData) {
            return settings
        }
        return Settings(userId: UUID(), color: "Green", name: "Anonymous")
    }
    
    func saveToUserDefaults() {
        if let encoded = try? JSONEncoder().encode(self) {
            UserDefaults.standard.setValue(encoded, forKey: Settings.userDefaultsKey)
        }
    }
}
