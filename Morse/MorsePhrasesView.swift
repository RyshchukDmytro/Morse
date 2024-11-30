//
//  MorsePhrasesView.swift
//  Morse
//
//  Created by Dmytro Ryshchuk on 11/30/24.
//

import SwiftUI

struct MorsePhrasesView: View {
    let commonPhrasesInMorse: [String: String] = [
        "SOS": "... --- ...",
        "HELP": ".... . .-.. .--.",
        "THANK YOU": "- .... .- -. -.- / -.-- --- ..-",
        "GOOD MORNING": "--. --- --- -.. / -- --- .-. -. .. -. --.",
        "GOOD NIGHT": "--. --- --- -.. / -. .. --. .... -",
        "HOW ARE YOU?": ".... --- .-- / .- .-. . / -.-- --- ..- ..--..",
        "YES": "-.-- . ...",
        "NO": "-. ---",
        "PLEASE": ".--. .-.. . .- ... .",
        "I LOVE YOU": ".. / .-.. --- ...- . / -.-- --- ..-",
        "HAPPY BIRTHDAY": ".... .- .--. .--. -.-- / -... .. .-. - .... -.. .- -.--",
        "WELCOME": ".-- . .-.. -.-. --- -- .",
        "CONGRATULATIONS": "-.-. --- -. --. .-. .- - ..- .-.. .- - .. --- -. ...",
        "GOODBYE": "--. --- --- -.. -... -.-- .",
        "SEE YOU LATER": "... . . / -.-- --- ..- / .-.. .- - . .-.",
        "BEST WISHES": "-... . ... - / .-- .. ... .... . ...",
        "TAKE CARE": "- .- -.- . / -.-. .- .-. .",
        "HAPPY NEW YEAR": ".... .- .--. .--. -.-- / -. . .-- / -.-- . .- .-.",
    ]
    
    let famousMessagesInMorse: [String: String] = [
        "First telegraph message: \"What hath God wrought\"": ".-- .... .- - / .... .- - .... / --. --- -.. / .-- .-. --- ..- --. .... -",
        "Titanic distress signal: \"We are sinking\"": ".-- . / .- .-. . / ... .. -. -.- .. -. --.",
        "Titanic's SOS": "... --- ...",
        "Apollo 11 moon landing: \"Houston, Tranquility Base here. The Eagle has landed.\"": ".... --- ..- ... - --- -. --..-- / - .-. .- -. --.- ..- .. .-.. .. - -.-- / -... .- ... . / .... . .-. . .-.-.- / - .... . / . .- --. .-.. . / .... .- ... / .-.. .- -. -.. . -.. .-.-.-",
        "WWII Victory in Europe Day: \"Victory in Europe\"": "...- .. -.-. - --- .-. -.-- / .. -. / . ..- .-. --- .--. .",
        "WWII D-Day landing message: \"The eyes of the world are upon you\"": "- .... . / . -.-- . ... / --- ..-. / - .... . / .-- --- .-. .-.. -.. / .- .-. . / ..- .--. --- -. / -.-- --- ..-",
        "Samuel Morse's first public demonstration: \"A patient waiter is no loser\"": ".- / .--. .- - .. . -. - / .-- .- .. - . .-. / .. ... / -. --- / .-.. --- ... . .-.",
        "End of WWII message: \"The war is over\"": "- .... . / .-- .- .-. / .. ... / --- ...- . .-."
    ]
    
    let viewModel = MorseViewModel()
    
    func customSection(with header: String, data: [String: String]) -> some View {
        Section(header: Text(header)) {
            ForEach(data.sorted(by: { $0.key < $1.key }), id: \.key) { phrase, morse in
                VStack(alignment: .leading) {
                    Text(phrase)
                        .font(.headline)
                    
                    HStack {
                        Text(morse)
                            .font(.body)
                        
                        Spacer()
                        
                        Button(action: {
                            viewModel.playMorseCode(morse)
                        }) {
                            CustomImages.waveform.image
                        }
                    }
                }
            }
        }

    }
    
    var body: some View {
        List {
            customSection(with: "Common phrases", data: commonPhrasesInMorse)
            customSection(with: "Famous messages", data: famousMessagesInMorse)
        }
        .navigationTitle("Common Phrases")
        .tabItem {
            Label {
                Text("Phrases")
            } icon: {
                CustomImages.antennaRadiowavesLeftAndRight.image
            }
        }
    }
}

//#Preview {
//    MorsePhrasesView()
//}
