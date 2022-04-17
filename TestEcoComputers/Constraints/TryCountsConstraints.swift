import UIKit

extension TryCountsViewController {
    
    func setupConstraints() {
       view.addSubview(scoresLabel)
       view.addSubview(humansTriesCountLabel)
       view.addSubview(compTriesCountLabel)
       view.addSubview(winnerLabel)
       view.addSubview(backButton)
       
       scoresLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
       scoresLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       scoresLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
       scoresLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
       
       humansTriesCountLabel.topAnchor.constraint(equalTo: scoresLabel.topAnchor, constant: 100).isActive = true
       humansTriesCountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35).isActive = true
       humansTriesCountLabel.widthAnchor.constraint(equalToConstant: 210).isActive = true
       humansTriesCountLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
       
       compTriesCountLabel.topAnchor.constraint(equalTo: scoresLabel.topAnchor, constant: 130).isActive = true
       compTriesCountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35).isActive = true
       compTriesCountLabel.widthAnchor.constraint(equalToConstant: 320).isActive = true
       compTriesCountLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
       
       winnerLabel.bottomAnchor.constraint(equalTo: backButton.bottomAnchor, constant: -100).isActive = true
       winnerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       winnerLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true
       winnerLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
       
       
       backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
       backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       backButton.widthAnchor.constraint(equalToConstant: 350).isActive = true
       backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
   }
}
