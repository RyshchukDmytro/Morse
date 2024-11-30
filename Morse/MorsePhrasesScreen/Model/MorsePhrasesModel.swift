//
//  MorsePhrasesModel.swift
//  Morse
//
//  Created by Dmytro Ryshchuk on 11/30/24.
//

class MorsePhrasesModel {
    private let commonPhrasesInMorse: [String: String] = [
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
    
    private let famousMessagesInMorse: [String: String] = [
        "First telegraph message: \"What hath God wrought\"": ".-- .... .- - / .... .- - .... / --. --- -.. / .-- .-. --- ..- --. .... -",
        "Titanic distress signal: \"We are sinking\"": ".-- . / .- .-. . / ... .. -. -.- .. -. --.",
        "Titanic's SOS": "... --- ...",
        "Apollo 11 moon landing: \"Houston, Tranquility Base here. The Eagle has landed.\"": ".... --- ..- ... - --- -. --..-- / - .-. .- -. --.- ..- .. .-.. .. - -.-- / -... .- ... . / .... . .-. . .-.-.- / - .... . / . .- --. .-.. . / .... .- ... / .-.. .- -. -.. . -.. .-.-.-",
        "WWII Victory in Europe Day: \"Victory in Europe\"": "...- .. -.-. - --- .-. -.-- / .. -. / . ..- .-. --- .--. .",
        "WWII D-Day landing message: \"The eyes of the world are upon you\"": "- .... . / . -.-- . ... / --- ..-. / - .... . / .-- --- .-. .-.. -.. / .- .-. . / ..- .--. --- -. / -.-- --- ..-",
        "Samuel Morse's first public demonstration: \"A patient waiter is no loser\"": ".- / .--. .- - .. . -. - / .-- .- .. - . .-. / .. ... / -. --- / .-.. --- ... . .-.",
        "End of WWII message: \"The war is over\"": "- .... . / .-- .- .-. / .. ... / --- ...- . .-."
    ]
    
    func getCommonPhrases() -> [String: String] {
        commonPhrasesInMorse
    }
    
    func getFamousMessages() -> [String: String] {
        famousMessagesInMorse
    }
}
