//
//  PracticeModel.swift
//  Morse
//
//  Created by Dmytro Ryshchuk on 12/1/24.
//

class PracticeModel {
    private let phrase: String
    private let morseCode: String
    
    init(phrase: String, morseCode: String) {
        self.phrase = phrase
        self.morseCode = morseCode
    }
    
    func getPhrase() -> String {
        phrase
    }
    
    func getMorseCode() -> String {
        morseCode
    }
}
