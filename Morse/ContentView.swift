//
//  ContentView.swift
//  Mosze
//
//  Created by Dmytro Ryshchuk on 11/26/24.
//

import SwiftUI

struct ContentView: View {
    @State private var textEntered: String = ""
    @State private var textResult: String = ""
    
    private var viewModel = MorseViewModel()
    
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            
            VStack() {
                Text(textResult)
                
                TextField("Write your text to transfer to mosze here", text: $textEntered)
                    .background(Color.yellow.opacity(0.9))
                    .onChange(of: textEntered) {
                        textResult = viewModel.textToMorseTransformation(from: textEntered)
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
