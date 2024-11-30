//
//  SettingsViewModel.swift
//  Morse
//
//  Created by Dmytro Ryshchuk on 11/30/24.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    @AppStorage("durationValue") var durationValue: Double = 0.1
    @AppStorage("sampleRateValue") var sampleRateValue: Double = 44100.0

    @Published var sliderDurationValue: Double = 0.1
    @Published var sliderSampleRateValue: Double = 44100.0
    
    init() {
        self.sliderDurationValue = durationValue
        self.sliderSampleRateValue = sampleRateValue
    }

    func updateDurationValue(_ newValue: Double) {
        durationValue = newValue
        sliderDurationValue = newValue
    }

    func updateSampleRateValue(_ newValue: Double) {
        sampleRateValue = newValue
        sliderSampleRateValue = newValue
    }
}
