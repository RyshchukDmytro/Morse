//
//  SettingsScreen.swift
//  Morse
//
//  Created by Dmytro Ryshchuk on 11/29/24.
//

import SwiftUI

struct SettingsScreen: View {
    @StateObject private var viewModel = SettingsViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("Sound Duration: \(String(format: "%.2f", viewModel.sliderDurationValue)) sec")
                    .font(.headline)
                
                Slider(value: $viewModel.sliderDurationValue, in: 0.08...0.5, step: 0.02)
                    .padding()
                    .accentColor(.blue)
                    .onChange(of: viewModel.sliderDurationValue) { oldValue, newValue in
                        viewModel.updateDurationValue(newValue)
                    }
            }
            
            HStack {
                Text("Sample Rate: \(Int(viewModel.sliderSampleRateValue)) Hz")
                    .font(.headline)

                Slider(value: $viewModel.sliderSampleRateValue, in: 8000...48000, step: 1000)
                    .padding()
                    .accentColor(.blue)
                    .onChange(of: viewModel.sliderSampleRateValue) { oldValue, newValue in
                        viewModel.updateSampleRateValue(newValue)
                    }
            }
        }
        .navigationTitle("Settings")
        .tabItem {
            Label("Settings", systemImage: "ellipsis.circle")
        }
    }
}

//#Preview {
//    SettingsScreen()
//}
