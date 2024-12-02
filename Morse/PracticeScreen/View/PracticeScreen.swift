//
//  PracticeScreen.swift
//  Morse
//
//  Created by Dmytro Ryshchuk on 12/1/24.
//

import SwiftUI

struct PracticeScreen: View {
    private let viewModel: PracticeScreenViewModel
    
    init(soundPlayer: MorseSoundPlayer, model: PracticeModel) {
        self.viewModel = PracticeScreenViewModel(soundPlayer: soundPlayer, model: model)
    }
    
    var body: some View {
        HStack {
            VStack {
                Text(viewModel.getPhrase())
                Text(viewModel.getMorseCode())
            }
            
            Button(action: {
                viewModel.playMorseCode()
            }) {
                CustomImages.waveform.image
                    .foregroundColor(.blue)
            }
        }
    }
}

//#Preview {
//    PracticeScreen()
//}
