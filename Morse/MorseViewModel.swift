//
//  MorseViewModel.swift
//  Morse
//
//  Created by Dmytro Ryshchuk on 11/26/24.
//

import Foundation
import AVFoundation

class MorseViewModel {
    @Published var isRunning = false
    private let symbolsDict: [String: String] = [
        "A": ".−", "B": "−...", "C": "−.−.", "D": "−..", "E": ".",
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
    
    private let invertedSymbolsDict: [String: String] = [
        ".-": "A", "-...": "B", "-.-.": "C", "-..": "D", ".": "E",
        "..-.": "F", "--.": "G", "....": "H", "..": "I", ".---": "J",
        "-.-": "K", ".-..": "L", "--": "M", "-.": "N", "---": "O",
        ".--.": "P", "--.-": "Q", ".-.": "R", "...": "S", "-": "T",
        "..-": "U", "...-": "V", ".--": "W", "-..-": "X", "-.--": "Y",
        "--..": "Z", "-----": "0", ".----": "1", "..---": "2", "...--": "3",
        "....-": "4", ".....": "5", "-....": "6", "--...": "7", "---..": "8",
        "----.": "9", ".-.-.-": ".", "--..--": ",", "..--..": "?", ".----.": "'",
        "-.-.--": "!", "-..-.": "/", "-.--.": "(", "-.--.-": ")",
        ".-...": "&", "---...": ":", "-.-.-.": ";", "-...-": "=", ".-.-.": "+",
        "-....-": "-", "..--.-": "_", ".-..-.": "\"", "...-..-": "$", ".--.-.": "@"
    ]

    
    func textToMorseTransformation(from text: String, _ mode: Bool) -> String {
        var morseText = ""
        
        let cleanedText = normalizeInput(text)
        print(text, cleanedText)

        
        if mode {
            // Mode: text → morse
            morseText = cleanedText.uppercased().map { char in
                if char == " " {
                    return "/"
                } else {
                    return symbolsDict[String(char)] ?? "?"
                }
            }.joined(separator: " ")
        } else {
            // Mode: morse → text
            let morseComponents = cleanedText.split(separator: " ") // separate symbols by blank space
            print("m: ", morseComponents)
            for component in morseComponents {
                if component == "/" {
                    morseText += " " // add blank space between words
                } else {
                    morseText += invertedSymbolsDict[String(component)] ?? "?" // receive right character
                }
            }
        }
        
        return morseText
    }

    private func normalizeInput(_ text: String) -> String {
        return text
            .replacingOccurrences(of: "…", with: "...") // replace 3 dots
            .replacingOccurrences(of: "-", with: "-")   // replace "-" to make "-"
            .replacingOccurrences(of: "—", with: "--")   // replace "–" to make "--"
            .replacingOccurrences(of: "—-", with: "---")   // replace "–-" to make "---"
            .replacingOccurrences(of: "——", with: "----")   // replace "––" to make "----"
            .replacingOccurrences(of: "——-", with: "-----")   // replace "––-" to make "-----"
    }

}

// MARK: - Work with light
extension MorseViewModel {
    func sendMorseCode(_ text: String) {
        isRunning = true
        let morseSequence = text.uppercased().compactMap { symbolsDict[String($0)] }.joined(separator: " ")
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            for symbol in morseSequence {
                if !self.isRunning { break }
                switch symbol {
                case ".":
                    toggleFlashlight(on: true)
                    usleep(200_000) // Short signal (0.2 secunds)
                    toggleFlashlight(on: false)
                case "−":
                    toggleFlashlight(on: true)
                    usleep(600_000) // Long signal (0.6 secunds)
                    toggleFlashlight(on: false)
                case " ":
                    usleep(200_000) // Space between symbols
                case "/":
                    usleep(600_000) // Space between words
                default:
                    break
                }
                usleep(200_000) // Space between dot and dash
            }
            DispatchQueue.main.async { [weak self] in
                self?.isRunning = false
            }
        }
    }
    
    func stopMorseCode() {
        isRunning = false
        toggleFlashlight(on: false)
    }
    
    private func toggleFlashlight(on: Bool) {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                device.torchMode = on ? .on : .off
                device.unlockForConfiguration()
            } catch {
                print("Could not change state of light: \(error))")
            }
        }
    }
}
