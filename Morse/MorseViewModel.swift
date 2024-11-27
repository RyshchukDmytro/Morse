//
//  MorseViewModel.swift
//  Mosze
//
//  Created by Dmytro Ryshchuk on 11/26/24.
//

import Foundation
import AVFoundation

class MorseViewModel {
    @Published var isRunning = false
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
    
    func textToMorseTransformation(from text: String) -> String {
        var morseText = ""
        
        for elem in text.uppercased() {
            if elem == " " {
                morseText = "\(morseText) /"
            } else {
                morseText = "\(morseText) \(symbolsDict[String(elem)] ?? " ")"
            }
        }
        
        return morseText
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
                    usleep(200_000) // Short signal (0.2 секунди)
                    toggleFlashlight(on: false)
                case "−":
                    toggleFlashlight(on: true)
                    usleep(600_000) // Long signal (0.6 секунди)
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
