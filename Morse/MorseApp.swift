//
//  MorseApp.swift
//  Morse
//
//  Created by Dmytro Ryshchuk on 11/26/24.
//

import SwiftUI
import SwiftData

@main
struct MorseApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                MorseMainScreen()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                MorseListScreen()
                    .tabItem {
                        Label("Morse List", systemImage: "list.bullet")
                    }
            }
        }
    }
}
