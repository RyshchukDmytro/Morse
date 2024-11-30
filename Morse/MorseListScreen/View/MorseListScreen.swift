//
//  MorseListScreen.swift
//  Morse
//
//  Created by Dmytro Ryshchuk on 11/29/24.
//

import SwiftUI

struct MorseListScreen: View {
    private var viewModel = MorseListViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.returnSortedSymbols(), id: \.0) { key, value in
                HStack {
                    Text(key)
                        .font(.headline) // prefer largeTitle
                        .frame(width: 50, alignment: .leading)
                    
                    Text(value)
                        .font(.body) // prefer largeTitle
                    
                    Spacer()
                    
                    Button("", systemImage: "waveform") {
                        viewModel.playMorseCode(value)
                    }
                }
            }
        }
        .navigationTitle("Morse Symbols")
        .tabItem {
            Label("Morse", systemImage: "list.bullet")
        }
    }
}

#Preview {
    MorseListScreen()
}
