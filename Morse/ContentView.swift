//
//  ContentView.swift
//  Morse
//
//  Created by Dmytro Ryshchuk on 11/26/24.
//

import SwiftUI

struct ContentView: View {
    @State private var textEntered: String = ""
    @State private var textResult: String = ""
    @State private var isMorseMode: Bool = true
    
    private var viewModel = MorseViewModel()
    
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            
            VStack() {
                Text(textResult)
                
                HStack {
                    TextField("Write your text to transfer to morse here", text: $textEntered)
                        .background(Color.yellow.opacity(0.9))
                        .onChange(of: textEntered) {
                            textResult = viewModel.textToMorseTransformation(from: textEntered, isMorseMode)
                        }
                    
                    // toggle to change mode to transfer text → morse code or morse code → text
                    Toggle("", isOn: $isMorseMode)
                        .labelsHidden()
                }
                
                Button(action: {
                    if viewModel.isRunning {
                        viewModel.stopMorseCode()
                    } else {
                        viewModel.sendMorseCode(textEntered)
                    }
                }) {
                    Text(viewModel.isRunning ? "Stop" : "Light up morse code")
                        .font(.headline)
                        .padding()
                        .background(viewModel.isRunning ? Color.red : Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding(20)
        }
    }
}

#Preview {
    ContentView()
}
