//
//  MorzeViewModel.swift
//  Morze
//
//  Created by Dmytro Ryshchuk on 11/26/24.
//

import Foundation

class MorzeViewModel {
    private let symbolsDict: [String: String] = ["A": ".−", "B": "−...", "C": "−.−.", "D": "−..", "E": ".",
                                                 "F": "..−.", "G": "−−.", "H": "....", "I": "..", "J": ".−−−",
                                                 "K": "−.−", "L": ".−..", "M": "−−", "N": "−.", "O": "−−−",
                                                 "P": ".−−.", "Q": "−−.−", "R": ".−.", "S": "...", "T": "−",
                                                 "U": "..−", "V": "...−", "W": ".−−", "X": "−..−", "Y": "−.−−",
                                                 "Z": "−−..", "0": "−−−−−", "1": ".−−−−", "2": "..−−−",
                                                 "3": "...−−", "4": "....−", "5": ".....", "6": "−....",
                                                 "7": "−−...", "8": "−−−..", "9": "−−−−.",
                                                 ".": ".−.−.−", ",": "−−..−−", "?": "..−−..", "'": ".−−−−.",
                                                 "!": "−.−.−−", "/": "−..−.", "(": "−.−−.", ")": "−.−−.−",
                                                 "&": ".−...", ":": "−−−...", ";": "−.−.−.", "=": "−...−",
                                                 "+": ".−.−.", "-": "−....−", "_": "..−−.−", "\"": ".−..−.",
                                                 "$": "...−..−", "@": ".−−.−."
                                                ]
    
    func textToMorzeTransformation(from text: String) -> String {
        var morzeText = ""
        
        for elem in text.uppercased() {
            if elem == " " {
                morzeText = "\(morzeText) /"
            } else {
                morzeText = "\(morzeText) \(symbolsDict[String(elem)] ?? " ")"
            }
        }
        
        return morzeText
    }
}
