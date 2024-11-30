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
    private var viewModel = MorseViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                MorseMainScreen(viewModel: viewModel)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                MorseListScreen(viewModel: viewModel)
                    .tabItem {
                        Label("Morse List", systemImage: "list.bullet")
                    }
            }
        }
    }
}
