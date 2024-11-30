//
//  MorseMainScreen.swift
//  Morse
//
//  Created by Dmytro Ryshchuk on 11/26/24.
//

import SwiftUI

struct MorseMainScreen: View {
    @State private var textEntered: String = ""
    @State private var textResult: String = ""
    @State private var isMorseMode: Bool = true
    @State private var isSoundMode: Bool = false
    @State private var isLightMode: Bool = false
    
    private var viewModel = MorseViewModel()
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            VStack() {
                Text(textResult)
                
                TextField("Write your text to transfer to morse here", text: $textEntered)
                    .background(Color.yellow.opacity(0.9))
                    .onChange(of: textEntered) {
                        textResult = viewModel.textToMorseTransformation(from: textEntered, isMorseMode)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                HStack {
                    Button(action: {
                        if viewModel.isRunning {
                            viewModel.stopMorseCode()
                        } else {
                            if isLightMode {
                                viewModel.sendMorseCode(textEntered)
                            } else if isSoundMode {
                                viewModel.playMorseCode(textResult)
                            }
                            //                        viewModel.sendMorseCodeWithLightAndSound(textResult)
                        }
                    }) {
                        Label {
                        } icon: {
                            Image(systemName: "play")
                        }
                        .padding()
                        .background(viewModel.isRunning ? Color.red : Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        isLightMode.toggle()
                        isSoundMode = false
                    }) {
                        Text("Light")
                            .padding()
                            .background(isLightMode ? Color.green : Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        isSoundMode.toggle()
                        isLightMode = false
                    }) {
                        Text("Sound")
                            .padding()
                            .background(isSoundMode ? Color.green : Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    // button to change mode to transfer text → morse code or morse code → text
                    Button(action: {
                        isMorseMode.toggle()
                    }) {
                        Text(isMorseMode ? "Text" : "Code")
                            .padding()
                            .background(isMorseMode ? Color.green : Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .onChange(of: isMorseMode) { oldValue, newValue in
                                if !newValue {
                                    isSoundMode = false
                                    isLightMode = false
                                }
                            }
                    }
                }
                Spacer()
            }
            .padding(20)
        }
        .tabItem {
            Label("Home", systemImage: "house")
        }
        .navigationTitle("Main")
    }
}

#Preview {
    MorseMainScreen()
}
