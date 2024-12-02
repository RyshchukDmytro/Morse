//
//  MorsePhrasesViewModel.swift
//  Morse
//
//  Created by Dmytro Ryshchuk on 11/30/24.
//

class MorsePhrasesViewModel {
    private let model = MorsePhrasesModel()
    private let soundPlayer: MorseSoundPlayer
    
    init(soundPlayer: MorseSoundPlayer) {
        self.soundPlayer = soundPlayer
    }
    
    func getCommonPhrases() -> [String: String] {
        model.getCommonPhrases()
    }
    
    func getFamousMessages() -> [String: String] {
        model.getFamousMessages()
    }

    func playMorseCode(_ morseCode: String) {
        soundPlayer.playMorseCode(morseCode)
    }
    
    func getSoundPlayer() -> MorseSoundPlayer {
        soundPlayer
    }
    
    func getPracticeModel(from phrase: String, _ morseCode: String) -> PracticeModel {
        PracticeModel(phrase: phrase, morseCode: morseCode)
    }
}
