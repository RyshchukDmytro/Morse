//
//  MorseSoundPlayer.swift
//  Morse
//
//  Created by Dmytro Ryshchuk on 11/27/24.
//

import AVFoundation

class MorseSoundPlayer {
    private var audioPlayer: AVAudioPlayer?
    
    func playDot() {
        playSound(frequency: 1000, duration: 0.1) // Dot: short sound
    }
    
    func playDash() {
        playSound(frequency: 1000, duration: 0.2) // Dash: long sound
    }
    
    private func playSound(frequency: Double, duration: Double) {
        let sampleRate = 44100.0
        let numSamples = Int(sampleRate * duration)
        var buffer = [Float](repeating: 0, count: numSamples)
        
        for i in 0..<numSamples {
            let angle = 2.0 * .pi * frequency * Double(i) / sampleRate
            buffer[i] = Float(sin(angle))
        }
        
        let audioFormat = AVAudioFormat(standardFormatWithSampleRate: sampleRate, channels: 1)!
        let pcmBuffer = AVAudioPCMBuffer(pcmFormat: audioFormat, frameCapacity: UInt32(numSamples))!
        pcmBuffer.frameLength = UInt32(numSamples)
        
        let floatChannel = pcmBuffer.floatChannelData!.pointee
        for i in 0..<numSamples {
            floatChannel[i] = buffer[i]
        }
        
        do {
            let audioEngine = AVAudioEngine()
            let audioNode = AVAudioPlayerNode()
            audioEngine.attach(audioNode)
            audioEngine.connect(audioNode, to: audioEngine.mainMixerNode, format: audioFormat)
            audioNode.scheduleBuffer(pcmBuffer, at: nil, options: .interrupts)
            
            try audioEngine.start()
            audioNode.play()
            Thread.sleep(forTimeInterval: duration)
            audioNode.stop()
            audioEngine.stop()
        } catch {
            print("Error in sound: \(error)")
        }
    }
}
