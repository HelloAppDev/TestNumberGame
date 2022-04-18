import UIKit

extension HumanAttemptViewController: UITextFieldDelegate {
    
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
        func showAlert(message: String) {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(defaultAction)
            self.present(alert, animated: true)
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard !string.isEmpty else {
                return true
            }
            if guessingTextField.keyboardType == .numberPad {
                if CharacterSet(charactersIn: "A-Za-zА-Яа-я").isSuperset(of: CharacterSet(charactersIn: string)) {
                    showAlert(message: "This field accepts only numeric entries!")
                    return false
                }
            }
            if let text = guessingTextField.text, let range = Range(range, in: text) {
                let proposedText = text.replacingCharacters(in: range, with: string)

                guard proposedText.count <= 3 else {
                    if string.count > 1 {
                        showAlert(message: "Paste failed: maximum characters count exceeded.")
                    }
                    return false
                }
                guessButton.isEnabled = (proposedText.count <= 3)
            }
            return true
        }
    
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    }


