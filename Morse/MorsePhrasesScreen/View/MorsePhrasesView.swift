//
//  MorsePhrasesView.swift
//  Morse
//
//  Created by Dmytro Ryshchuk on 11/30/24.
//

import SwiftUI

struct MorsePhrasesView: View {
    private let viewModel: MorsePhrasesViewModel
    
    init(soundPlayer: MorseSoundPlayer) {
        self.viewModel = MorsePhrasesViewModel(soundPlayer: soundPlayer)
    }
    
    private func customSection(with header: String, data: [String: String]) -> some View {
        Section(header: Text(header)) {
            ForEach(data.sorted(by: { $0.key < $1.key }), id: \.key) { phrase, morse in
                let practiceModel = viewModel.getPracticeModel(from: phrase, morse)
                
                NavigationLink(destination: PracticeScreen(soundPlayer: viewModel.getSoundPlayer(), model: practiceModel)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(phrase)
                                .font(.headline)
                            
                            Text(morse)
                                .font(.body) 
                        }
                        
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
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                customSection(with: "Common phrases", data: viewModel.getCommonPhrases())
                customSection(with: "Famous messages", data: viewModel.getFamousMessages())
            }
        }
        .navigationTitle("Common Phrases")
        .tabItem {
            Label {
                Text("Phrases")
            } icon: {
                CustomImages.antennaRadiowavesLeftAndRight.image
            }
        }
    }
}

//#Preview {
//    MorsePhrasesView()
//}
