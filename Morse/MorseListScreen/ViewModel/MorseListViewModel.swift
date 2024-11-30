//
//  MorseListViewModel.swift
//  Morse
//
//  Created by Dmytro Ryshchuk on 11/29/24.
//

class MorseListViewModel {
    let viewModel = MorseViewModel()
    
    func returnSortedSymbols() -> [(String, String)] {
        return viewModel.symbolsDict.sorted {
            let key1Category = $0.key.first?.categoryOrder ?? 3
            let key2Category = $1.key.first?.categoryOrder ?? 3
            
            if key1Category == key2Category {
                return $0.key < $1.key // If category the same sort by alphabet
            }
            return key1Category < key2Category // Sort by category
        }
    }
    
    func playMorseCode(_ morseCode: String) {
        viewModel.playMorseCode(morseCode)
    }
}
