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
                    
                    Button(action: {
                        viewModel.playMorseCode(value)
                    }) {
                        CustomImages.waveform.image
                    }
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
