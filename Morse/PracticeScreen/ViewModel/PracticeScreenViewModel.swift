//
//  PracticeScreenViewModel.swift
//  Morse
//
//  Created by Dmytro Ryshchuk on 12/1/24.
//

class PracticeScreenViewModel {
    private let soundPlayer: MorseSoundPlayer
    private let model: PracticeModel
    
    init(soundPlayer: MorseSoundPlayer, model: PracticeModel) {
        self.soundPlayer = soundPlayer
        self.model = model
    }
    
    func playMorseCode(_ morseCode: String? = nil) {
        let morseCode = morseCode ?? model.getMorseCode()
        soundPlayer.playMorseCode(morseCode)
    }
    
    func getPhrase() -> String {
        model.getPhrase()
    }
    
    func getMorseCode() -> String {
        model.getMorseCode()
    }
}
