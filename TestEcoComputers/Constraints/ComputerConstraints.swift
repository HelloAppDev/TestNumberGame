import UIKit

extension ComputerAttemptViewController {
    
    func setupConstraints() {
       view.addSubview(moreButton)
       view.addSubview(equalButton)
       view.addSubview(lessButton)
       view.addSubview(tryLabel)
       view.addSubview(compGuessingLabel)
       view.addSubview(yourNumberLabel)
       view.addSubview(myNumberLabel)
       
       moreButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
       moreButton.trailingAnchor.constraint(equalTo: equalButton.trailingAnchor, constant: -90).isActive = true
       moreButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
       moreButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
       
       equalButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
       equalButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       equalButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
       equalButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
       
       lessButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
       lessButton.leadingAnchor.constraint(equalTo: equalButton.leadingAnchor, constant: 90).isActive = true
       lessButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
       lessButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
       
       tryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
       tryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       tryLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
       tryLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
       
       compGuessingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 115).isActive = true
       compGuessingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       compGuessingLabel.widthAnchor.constraint(equalToConstant: 225).isActive = true
       compGuessingLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
       
       yourNumberLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 170).isActive = true
       yourNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       yourNumberLabel.widthAnchor.constraint(equalToConstant: 320).isActive = true
       yourNumberLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
       
       myNumberLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -180).isActive = true
       myNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       myNumberLabel.widthAnchor.constraint(equalToConstant: 260).isActive = true
       myNumberLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
   }
}
