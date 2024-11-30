//
//  MorsePhrasesViewModel.swift
//  Morse
//
//  Created by Dmytro Ryshchuk on 11/30/24.
//

class MorsePhrasesViewModel {
    private let soundPlayer = MorseSoundPlayer()
    private let model = MorsePhrasesModel()
    
    func getCommonPhrases() -> [String: String] {
        model.getCommonPhrases()
    }
    
    func getFamousMessages() -> [String: String] {
        model.getFamousMessages()
    }

    func playMorseCode(_ morseCode: String) {
        soundPlayer.playMorseCode(morseCode)
    }
}
