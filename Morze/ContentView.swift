//
//  ContentView.swift
//  Morze
//
//  Created by Dmytro Ryshchuk on 11/26/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var textEntered: String = ""
    @State private var textResult: String = ""
    
    let symbolsDict: [String: String] = ["A": ".−", "B": "−...", "C": "−.−.", "D": "−..", "E": ".",
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

    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    Text(textResult)
                    
                    TextField("Hey", text: $textEntered)
                        .background(Color.yellow.opacity(0.9))
                        .padding([.horizontal], 20)
                        .onChange(of: textEntered) {
                            textResult = ""
                            someMorzeMagicHere()
                        }
                }
            }
        }
    }
    
    private func someMorzeMagicHere() {
        for elem in textEntered.uppercased() {
            if elem == " " {
                textResult = "\(textResult)/"
            } else {
                textResult = "\(textResult) \(symbolsDict[String(elem)] ?? " ")"
            }
            print(textResult)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
