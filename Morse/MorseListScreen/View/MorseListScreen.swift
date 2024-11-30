//
//  MorseListScreen.swift
//  Morse
//
//  Created by Dmytro Ryshchuk on 11/29/24.
//

import SwiftUI

struct MorseListScreen: View {
    @ObservedObject var viewModel: MorseViewModel

    var body: some View {
        List {
            ForEach(viewModel.symbolsDict.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                HStack {
                    Text(key)
                        .font(.headline)
                        .frame(width: 50, alignment: .leading)
                    Text(value)
                        .font(.body)
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
    MorseListScreen(viewModel: MorseViewModel())
}
