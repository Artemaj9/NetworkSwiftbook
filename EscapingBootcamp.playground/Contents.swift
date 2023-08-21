import UIKit

// Framework method
func wordPecker(phrase: String, wordCompletion: @escaping (String) -> ()) {
    let words = phrase.split(separator: " ")
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
        wordCompletion("finish")
    }
    for word in words {
        for letter in word {
            print(letter)
        }
        wordCompletion(String(word))
    }
}

//Completion handler!!!

wordPecker(phrase: "Word Pecker") { someWord in
    print("--> \(someWord.uppercased()) completed")
}
