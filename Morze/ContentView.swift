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
    
    private var viewModel = MorzeViewModel()
    
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    Text(textResult)
                    
                    TextField("Write your text to transfer to morze here", text: $textEntered)
                        .background(Color.yellow.opacity(0.9))
                        .padding([.horizontal], 20)
                        .onChange(of: textEntered) {
                            textResult = viewModel.textToMorzeTransformation(from: textEntered)
                        }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
