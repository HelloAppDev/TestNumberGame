import UIKit

extension HumanAttemptViewController {
    
    func randomCompNumber() {
        while compNumber < 1 {
            let randomNumber = Int.random(in: 1..<100)
            compNumber = randomNumber
        }
    }
    
    func compGuessingPlus() {
        tryLabel.text = String("Try № \(humanGuesses)")
    }
    
    @objc func guessTapped() {
        compGuessingPlus()
        if guessingTextField.text == String(compNumber) {
            equalNumbers()
        } else if compNumber < Int(guessingTextField.text ?? "101") ?? 101 {
            humanGuesses += 1
            infoLabel.isHidden = false
            infoLabel.text = "No, my number is less than yours"
        } else {
            humanGuesses += 1
            infoLabel.isHidden = false
            infoLabel.text = "No, my number is more than yours"
        }
    }
}
