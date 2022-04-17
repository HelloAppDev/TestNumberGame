import UIKit

extension NumberSelectViewController: UITextFieldDelegate {
    
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
        if textField.keyboardType == .numberPad {
            if CharacterSet(charactersIn: "A-Za-zА-Яа-я").isSuperset(of: CharacterSet(charactersIn: string)) {
                showAlert(message: "This field accepts only numeric entries!")
                return false
            }
        }
        if let text = textField.text, let range = Range(range, in: text) {
            let proposedText = text.replacingCharacters(in: range, with: string)

            guard proposedText.count <= 3 else {
                if string.count > 1 {
                    showAlert(message: "Paste failed: maximum characters count exceeded.")
                }
                return false
            }
            enterNumberButton.isEnabled = (proposedText.count <= 3)
        }
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
