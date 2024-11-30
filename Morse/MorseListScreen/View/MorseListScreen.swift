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
            ForEach(viewModel.returnSortedSymbols(), id: \.0) { symbol, morse in
                HStack {
                    Text(symbol)
                        .font(.headline) // prefer largeTitle
                        .frame(width: 50, alignment: .leading)
                    
                    Text(morse)
                        .font(.body) // prefer largeTitle
                    
                    Spacer()
                    
                    Button(action: {
                        viewModel.playMorseCode(morse)
                    }) {
                        CustomImages.waveform.image
                            .foregroundColor(.blue)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .navigationTitle("Morse Symbols")
        .tabItem {
            Label {
                Text("Morse")
            } icon: {
                CustomImages.listBullet.image
            }
        }
    }
}

#Preview {
    MorseListScreen()
}
