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
    private let soundPlayer = MorseSoundPlayer()
    private let morseModel = MorseModel()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                MorseMainScreen(soundPlayer: soundPlayer, morseModel: morseModel)
                
                MorseListScreen(soundPlayer: soundPlayer, morseModel: morseModel)
                
                MorsePhrasesView(soundPlayer: soundPlayer)
                
                SettingsScreen()
            }
        }
    }
}
