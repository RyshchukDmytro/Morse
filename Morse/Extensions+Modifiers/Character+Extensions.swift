//
//  Character+Extensions.swift
//  Morse
//
//  Created by Dmytro Ryshchuk on 11/29/24.
//

extension Character {
    // What I want [A-Z, 0-9, !-_]
    var categoryOrder: Int {
        if self.isLetter {
            return 0 // Letters top priority
        } else if self.isNumber {
            return 1 // Numbers after letters
        } else {
            return 2 // Symbols afters numbers
        }
    }
}
