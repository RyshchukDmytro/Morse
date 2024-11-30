//
//  SettingsScreen.swift
//  Morse
//
//  Created by Dmytro Ryshchuk on 11/29/24.
//

import SwiftUI

struct SettingsScreen: View {
    @AppStorage("durationValue") private var durationValue: Double = 0.1
    @AppStorage("sampleRateValue") private var sampleRateValue: Double = 44100
    
    @State private var sliderDurationValue: Double = 0.1
    @State private var sliderSampleRateValue: Double = 44100
    
    var body: some View {
        VStack {
            HStack {
                Text("Sound Duration: \(String(format: "%.2f", sliderDurationValue)) sec")
                    .font(.headline)
                
                Slider(value: $sliderDurationValue, in: 0.02...0.5, step: 0.02)
                    .padding()
                    .accentColor(.blue)
                    .onChange(of: sliderDurationValue) { oldValue, newValue in
                        durationValue = newValue
                    }
            }
            
            HStack {
                Text("Sample Rate: \(Int(sliderSampleRateValue)) Hz")
                    .font(.headline)

                Slider(value: $sliderSampleRateValue, in: 8000...48000, step: 1000)
                    .padding()
                    .accentColor(.blue)
                    .onChange(of: sliderSampleRateValue) { oldValue, newValue in
                        sampleRateValue = newValue
                    }
            }
        }
        .navigationTitle("Settings")
        .tabItem {
            Label("Settings", systemImage: "ellipsis.circle")
        }
    }
}

#Preview {
    SettingsScreen()
}
