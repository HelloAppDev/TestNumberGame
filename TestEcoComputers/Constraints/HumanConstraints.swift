import UIKit

extension HumanAttemptViewController {
    
    func setupConstraints() {
        view.addSubview(guessButton)
        view.addSubview(tryLabel)
        view.addSubview(guessingLabel)
        view.addSubview(guessingTextField)
        view.addSubview(infoLabel)
        
        guessButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        guessButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        guessButton.widthAnchor.constraint(equalToConstant: 350).isActive = true
        guessButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        tryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        tryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tryLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        tryLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        guessingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        guessingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        guessingLabel.widthAnchor.constraint(equalToConstant: 180).isActive = true
        guessingLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        guessingTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        guessingTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        guessingTextField.widthAnchor.constraint(equalToConstant: 280).isActive = true
        guessingTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        infoLabel.topAnchor.constraint(equalTo: guessButton.topAnchor, constant: 80).isActive = true
        infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
